class AddNameToWikis < ActiveRecord::Migration
  def change
    add_column :wikis, :todo_id, :integer
    add_column :wikis, :photo_id, :binary
   
  end
end
