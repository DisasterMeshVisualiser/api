module API
  module V1
    class Mesh < Grape::API
      resource :mesh do

        params do
          requires :mesh_type, type: Integer, desc: 'MeshType id.'
        end
        get '/', jbuilder: 'meshes/index.json' do
          @mesh_type = ::MeshType.find(params[:mesh_type])
        end
      end
    end
  end
end
