class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.integer :album_id, null: false
      t.boolean :favotite, :default => false
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :tracks, [:album_id, :name], unique: true
    add_index :tracks, :user_id
  end
end
