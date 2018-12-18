class GalaxiesController < ApplicationController
  def index
    @galaxies = Galaxy.all
  end

  def new
    @galaxy = Galaxy.new
  end

  def create
    @galaxy = Galaxy.new galaxy_params
    if @galaxy.save
      redirect_to galaxies_path, notice: 'Created'
    else
      flash[:alert] = 'Error'
      render :new
    end
  end


  private

  def galaxy_params
    params.require(:galaxy).permit(:title)
  end
end
