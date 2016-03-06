json.set! :data do
  json.array!(@mesh_type.meshs) do |mesh|
    json.set! :meshcode, mesh.mesh_code.value
    json.extract! mesh, :value
  end
end
