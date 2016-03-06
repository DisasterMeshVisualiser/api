module API
  module V1
    class Root < Grape::API
      version :v1
      format :json
      formatter :json, Grape::Formatter::Jbuilder

      mount API::V1::MeshType

      add_swagger_documentation base_path: '/api',
                                api_version: 'v1',
                                hide_documentation_path: true
    end
  end
end
