class CreateMeshCodes < ActiveRecord::Migration
  def change
    create_table :mesh_codes do |t|
      t.string :value
      t.integer :rank
      t.float :southwest_lat
      t.float :southwest_long

      t.timestamps null: false
    end
  end
end
