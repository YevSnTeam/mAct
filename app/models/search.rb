class Search < ActiveRecord::Base
  # attr_accessible :title, :body
   attr_accessor :keywords, :category_id
  validates_presence_of :keywords 
  
  def todos
  @todos ||= find_todos
  end
  
  private
  
  def find_todos
    Todo.find(:all, :conditions => conditions)
  end
  
  def keyword_conditions
    ["todos.name LIKE ?", "%#{keywords}%"] unless keywords.blank?
  end
  
  def category_conditions
    ["todos.category_id = ?", category_id] unless category_id.blank?
  end
  
  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end
  
  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end
  
  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end
  
  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end

end
