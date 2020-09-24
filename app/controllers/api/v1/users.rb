module Api
  module V1
    class Users < Grape::API
      resource :users do
        desc 'Return list of users'
        get do
          present User.all
        end

        desc 'Show user'
        get ':id' do
          present User.find params[:id]
        end

        desc 'create a new user'
        params do
          requires :name, type: String
        end
        post do
          User.create! name: params[:name]
        end
      end
    end
  end
end
