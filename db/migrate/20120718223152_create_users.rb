class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.date :born
      t.string :city
      t.boolean :enabled

      t.timestamps
    end
  end
end
