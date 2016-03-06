class CreateMeshCodes < ActiveRecord::Migration
  def change
    create_table :mesh_codes do |t|
      t.string :value
      t.integer :rank

      t.timestamps null: false
    end
  end
end
