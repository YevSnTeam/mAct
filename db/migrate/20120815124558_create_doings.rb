class CreateDoings < ActiveRecord::Migration
  def change
    create_table :doings do |t|
      t.integer :user_id
      t.integer :todo_id
      t.boolean :done
      t.boolean :do

      t.timestamps
    end
  end
end
