json.array!(@mesh_types) do |mesh_type|
  json.extract! mesh_type, :id, :name, :label
  json.url mesh_type_url(mesh_type, format: :json)
end
