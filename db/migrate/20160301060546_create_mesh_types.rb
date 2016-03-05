class CreateMeshTypes < ActiveRecord::Migration
  def change
    create_table :mesh_types do |t|
      t.string :name, null: false
      t.string :label, null: false

      t.timestamps null: false
    end
  end
end
