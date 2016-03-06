Rails.application.routes.draw do
  # NOTE: escape heavy render
  # resources :meshes
  resources :mesh_codes
  resources :mesh_types

  # api
  mount API::Root => '/'
  mount GrapeSwaggerRails::Engine => '/docs'

end
