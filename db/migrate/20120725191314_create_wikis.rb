class CreateWikis < ActiveRecord::Migration
  def change
    create_table :wikis do |t|

      t.timestamps
    end
  end
end
