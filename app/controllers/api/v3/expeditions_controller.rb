module Api::V3
  class ExpeditionsController < ApiController
    include Api::ExpeditionsController

    def show
      @expedition = Expedition.find(params[:id])
      render json: JsonWebToken.encode({data: JSON.parse(::V1::ExpeditionSerializer.new(@expedition).serialized_json), exp: (Time.zone.now + 7200).to_i})
    end

  end
end
