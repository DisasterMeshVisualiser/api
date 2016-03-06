json.set! :data do
  json.array!(@meshes) do |mesh|
    mesh_code = mesh.mesh_code
    json.set! :meshcode, mesh_code.value
    json.set! :coordinates, Coordinate.square_polygon(mesh_code.southwest_lat, mesh_code.southwest_long, mesh_code.rank)
    json.extract! mesh, :value
  end
end
