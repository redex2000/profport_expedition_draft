class ExpeditionsController < ApplicationController
  before_action :set_model, except: %I[index new create jsonp cors]
  before_action :authorize_class, only: %I[index new create]
  skip_before_action :authenticate_user!, only: %I[jsonp cors]

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
    respond_to do |format|
      if @expedition.save
        format.html { redirect_to expeditions_path, notice: 'Created' }
        format.js
      else
        format.html do
          flash[:alert] = "Ошибка при сохранении"
          render :new
        end
        format.js
      end
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
    respond_to do |format|
      format.js
      format.html { redirect_to expeditions_path, notice: 'Удалено' }
    end
  end


  def jsonp
    respond_to do |format|
      format.js
      format.html
    end
  end

  # Для простейшего запроса нужно выполнить из пустой страницы Хрома:
  # var xhr = new XMLHttpRequest();
  # xhr.open("GET", "http://localhost:3001/expeditions/cors.txt");
  # xhr.setRequestHeader("Content-Type", "text/plain");
  # xhr.onload = function(res) { console.log(res.currentTarget.responseText); }
  # xhr.send();
  def cors
    respond_to do |format|
      format.text { render plain: 'Hello' }
    end
  end

  private

  def set_model
    @expedition = Expedition.find params[:id]
    authorize @expedition
  end

  def expedition_params
    params.require(:expedition).permit(:title, :description)
  end


  def authorize_class
    authorize Expedition
  end
end
