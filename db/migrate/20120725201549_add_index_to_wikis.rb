class AddIndexToWikis < ActiveRecord::Migration
  def change
    add_index :wikis, [:todo_id, :created_at]
  end
  
end
