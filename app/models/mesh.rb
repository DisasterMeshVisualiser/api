class Mesh < ActiveRecord::Base
  belongs_to :mesh_type
  belongs_to :mesh_code
end
