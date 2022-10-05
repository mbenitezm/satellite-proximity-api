# frozen_string_literal: true

# Controller in charge of returning closest satellites to a point
module Api
  module V1
    class ProximityController < ApplicationController
      skip_forgery_protection

      before_action :sanitize_params

      def index
        satellites = ProximityService.closest_satellites(safe_params[:lat], safe_params[:lon], safe_params[:limit])
        render json: Api::V1::ProximitySerializer.new(satellites).serializable_hash, status: :ok
      end

      private

      def safe_params
        params.permit(:lat, :lon, :limit)
      end

      def sanitize_params
        params[:lat] = params[:lat].to_f
        params[:lon] = params[:lon].to_f
        params[:limit] = params[:limit].to_i
      end
    end
  end
end
