class ExpeditionsController < ApplicationController
  def index
    @expeditions = Expedition.all
  end

  def show
  end

  def new
    @expedition = Expedition.new
  end

  def create
    @expedition = Expedition.new expedition_params
    if @expedition.save
      redirect_to expeditions_path, notice: 'Created'
    else
      flash[:alert] = "Ошибка при сохранении"
      render :new
    end
  end

  private

  def set_model
    @expedition = Expedition.find params[:id]
  end

  def expedition_params
    params.require(:expedition).permit(:title)
  end
end
