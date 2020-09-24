module Api
  module V1
    class Reports < Grape::API
      resource :reports do
        desc 'Show report'
        params do
          requires :tablet_id, type: Integer
        end
        get do
          present Sensor.sort_by_hour_with(params[:tablet_id])
        end
      end
    end
  end
end
