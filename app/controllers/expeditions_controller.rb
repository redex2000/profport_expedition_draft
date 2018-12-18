class ExpeditionsController < ApplicationController
  before_action :set_model, except: %I[index new create]

  def index
    @data = Expedition
      .unscope(:order)
      .joins(:investments)
      .where("investments.paid = true")
      .where("investments.created_at between ? and ?", Time.zone.now - 3.days, Time.zone.now)
      .select("expeditions.id e_id, count(investments.id) as investments_count, (count(investments.id) * expeditions.price) as e_cost")
      .group("expeditions.id")
      .order("e_cost desc")
      .having('(count(investments.id) * expeditions.price) > 100')

    @expeditions = @data.inject([]) { |result, exp| result.push Expedition.find(exp[:e_id]) }
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

  private

  def set_model
    @expedition = Expedition.find params[:id]
  end

  def expedition_params
    params.require(:expedition).permit(:title)
  end
end
