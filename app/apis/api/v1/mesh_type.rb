module API
  module V1
    class MeshType < Grape::API
      resource :mesh_type do

        get '/', jbuilder: 'mesh_types/index.json' do
          @mesh_types = ::MeshType.all
        end
      end
    end
  end
end
