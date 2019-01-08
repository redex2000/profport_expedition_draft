class ExpeditionsController < ApplicationController
  before_action :set_model, except: %I[index new create]
  before_action :authorize_class, only: %I[index new create]

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


  def edit
  end


  def update
    if @expedition.update expedition_params
      redirect_to expeditions_path, notice: 'Updated'
    else
      flash[:alert] = "Ошибка при сохранении"
      render :edit
    end
  end


  def destroy
    @expedition.destroy
    redirect_to expeditions_path, notice: 'Удалено'
  end

  private

  def set_model
    @expedition = Expedition.find params[:id]
    authorize @expedition
  end

  def expedition_params
    params.require(:expedition).permit(:title)
  end


  def authorize_class
    authorize Expedition
  end
end
