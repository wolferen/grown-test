module Api
  class Base < Grape::API
    version 'v1', using: :accept_version_header
    format :json
    prefix 'api'

    mount Api::V1::Users
    mount Api::V1::Devices
    mount Api::V1::Telemetry
    mount Api::V1::Reports

    add_swagger_documentation api_version: 'v1'

    helpers do
      def current_user
        @current_user ||= User.find!(params[:user_id])
      end
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      message = e.message.gsub(/\s*\[.*\Z/, '')
      Rack::Response.new(
        [{ status: 404, status_code: "not_found", error: message }.to_json],
        404,
        { 'Content-Type' => 'application/json' }
      )
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      record = e.record
      message = e.message.downcase.capitalize
      Rack::Response.new(
        [{ status: 403, status_code: "record_invalid", error: message }.to_json],
        403,
        { 'Content-Type' => 'application/json' }
      )
    end
  end
end
