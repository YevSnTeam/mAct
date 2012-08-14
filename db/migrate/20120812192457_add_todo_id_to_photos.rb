class AddTodoIdToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :todo_id, :integer
  end
end
