class AddWikiIdToTodos < ActiveRecord::Migration
  def change
    add_column :todos, :wiki_id, :integer
  end
end
