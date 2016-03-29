class CreateMeshCodes < ActiveRecord::Migration
  def change
    create_table :mesh_codes do |t|
      t.string :value
      t.integer :rank
      t.decimal :southwest_lat, precision: 11, scale: 8
      t.decimal :southwest_long, precision: 11, scale: 8

      t.timestamps null: false
    end
  end
end
