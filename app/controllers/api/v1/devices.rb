# frozen_string_literal: true

module Api
  module V1
    class Devices < Grape::API
      resource :devices do
        desc 'Return list of devices by user id'
        params do
          requires :user_id, type: Integer
        end
        get do
          user = User.find params[:user_id]
          present user.device_data
        end

        desc 'Create a new device'
        params do
          requires :device_id, type: Integer
          requires :user_id, type: Integer
          requires :device_type, type: String
        end
        post do
          user = User.find params[:user_id]
          case params[:device_type].gsub('"', '')
          when 'phone'
            user.phones.create(params.except(:device_type))
          when 'browser'
            user.browsers.create(params.except(:device_type))
          when 'tablet'
            user.tablets.create(params.except(:device_type))
          end
        end
      end
    end
  end
end
