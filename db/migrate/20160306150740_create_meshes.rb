class CreateMeshes < ActiveRecord::Migration
  def change
    create_table :meshes do |t|
      t.string :value
      t.references :mesh_type, index: true, foreign_key: { on_delete: :cascade }
      t.references :mesh_code, index: true, foreign_key: { on_delete: :cascade }

      t.timestamps null: false
    end
  end
end
