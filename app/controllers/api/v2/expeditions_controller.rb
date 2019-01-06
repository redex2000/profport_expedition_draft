module Api::V2
  class ExpeditionsController < ApiController
    include Api::ExpeditionsController

    def update
      @expedition = Expedition.find(params[:id])
      if @expedition.update json['expedition']
        render json: { message: 'Обновление прошло успешно' }, status: 200
      else
        render json: { message: 'Во время обновления произошла ошибка', errors: @expedition.errors.messages }, status: :unprocessable_entity
      end
    end
  end
end
