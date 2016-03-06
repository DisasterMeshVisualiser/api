module API
  module V1
    class Root < Grape::API
      version :v1
      format :json
      formatter :json, Grape::Formatter::Jbuilder

      mount API::V1::MeshType
    end
  end
end
