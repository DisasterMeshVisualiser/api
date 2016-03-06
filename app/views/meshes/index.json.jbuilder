json.array!(@meshes) do |mesh|
  json.extract! mesh, :id, :value, :mesh_type_id, :mesh_code_id
  json.url mesh_url(mesh, format: :json)
end
