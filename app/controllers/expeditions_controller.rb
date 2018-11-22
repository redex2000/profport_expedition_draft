class ExpeditionsController < ApplicationController
  def index
    render plain: 'Космическая экспедиция'
  end


  def show
    render plain: params.inspect
  end
end
