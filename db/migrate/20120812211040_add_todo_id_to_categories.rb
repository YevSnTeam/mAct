class AddTodoIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :todo_id, :integer
  end
end
