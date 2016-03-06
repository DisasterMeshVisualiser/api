class MeshType < ActiveRecord::Base
  has_many :meshs
  has_many :mesh_codes, :through => :meshs
end
