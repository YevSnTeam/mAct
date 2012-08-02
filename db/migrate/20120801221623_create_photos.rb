class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :title
      t.binary :photofile
      t.boolean :enabled

      t.timestamps
    end
  end
end
