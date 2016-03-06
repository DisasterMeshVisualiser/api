json.set! :data do
  json.array!(@mesh_types) do |mesh_type|
    json.extract! mesh_type, :id, :name, :label
  end
end
