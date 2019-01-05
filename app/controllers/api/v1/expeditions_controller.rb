module Api::V1
  class ExpeditionsController < ApiController
    def index
      respond_to do |format|
        format.json do
          render json: ::V1::ExpeditionSerializer.new(Expedition.all).serialized_json
        end
      end
    end

    def show
      render json: ::V1::ExpeditionSerializer.new(Expedition.find(params[:id])).serialized_json
    end
  end
end
