class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.string :band_id, null: false
      t.integer :year, null: false
      t.integer :user_id, null: false
      t.boolean :favotite, :default => false

      t.timestamps null: false
    end
    add_index :albums, [:band_id, :name],  unique: true
    add_index :albums, :user_id
  end
end
