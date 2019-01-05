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


    def create
      @expedition = Expedition.new json['expedition']
      if @expedition.save
        render json: { message: 'Создано успешно' }, status: 200
      else
        render json: { message: 'Во время сохранения произошли ошибки', errors: @expedition.errors.messages }, status: :unprocessable_entity
      end
    end
  end
end
