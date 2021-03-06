class CreateBands < ActiveRecord::Migration
  def change
    create_table :bands do |t|
      t.string :name, null: false
      t.integer :user_id, null: false
      t.boolean :favotite, :default => false

      t.timestamps null: false
    end
      add_index :bands, :user_id
  end
end
