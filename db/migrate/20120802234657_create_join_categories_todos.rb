class CreateJoinCategoriesTodos < ActiveRecord::Migration
  def change
    create_table :categories_todos, id: false do |t|
      t.integer :category_id
      t.integer :todo_id
    end
  end
end
