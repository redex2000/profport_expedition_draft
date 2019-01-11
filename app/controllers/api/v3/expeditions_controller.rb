module Api::V3
  class ExpeditionsController < ApiController
    include Api::ExpeditionsController

    def show
      # Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjo3fQ.-Bm3C1AGUjjUjRiOIWPc7iZ32e5eFWRTk87ve-xXKWw
      @expedition = Expedition.find(params[:id])
      render json: JsonWebToken.encode({data: JSON.parse(::V1::ExpeditionSerializer.new(@expedition).serialized_json), exp: (Time.zone.now + 7200).to_i})
    end

  end
end
