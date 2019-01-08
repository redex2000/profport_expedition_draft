class SpaceshipsController < ApplicationController

  def new
    @spaceship = Spaceship.new
  end

  def create
    @spaceship = Spaceship.create spaceship_params
    redirect_to new_spaceship_path, notice: @spaceship.expedition.title
  end

  private

  def spaceship_params
    params.require(:spaceship).permit(:title, :velocity, :expedition_id)
  end

end
