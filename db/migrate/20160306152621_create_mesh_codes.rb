class CreateMeshCodes < ActiveRecord::Migration
  def change
    create_table :mesh_codes do |t|
      t.string :value
      t.integer :rank
      t.decimal :southwest_lat, precision: 6, scale: 3
      t.decimal :southwest_long, precision: 6, scale: 3

      t.timestamps null: false
    end
  end
end
