class DropJoinCategoriesTodosAktuell < ActiveRecord::Migration
   def change
     drop_table :categories_todos
   end 
end
