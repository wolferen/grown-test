module Api
  module V1
    class Telemetry < Grape::API
      resource :telemetry do
        desc 'Create a new Telemetry'
        params do
          requires :device_id, type: Integer
          requires :data, type: JSON
        end
        post do
          tablet = Tablet.find params[:device_id]
          ActiveRecord::Base.transaction do
            params[:data].each do |hash|
              tablet.sensors.create(hash)
            end
          end
        end
      end
    end
  end
end
