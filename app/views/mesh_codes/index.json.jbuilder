json.array!(@mesh_codes) do |mesh_code|
  json.extract! mesh_code, :id, :value, :rank, :southwest_lat, :southwest_long
  json.url mesh_code_url(mesh_code, format: :json)
end
