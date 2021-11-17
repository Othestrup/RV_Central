class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  def show
    @campers = Camper.find(params[:id])
  end

  def new
    @camper.Camper.new
  end

  def create
    @camper = Camper.new(camper_params)
    if @camper.save
      redirect_to camper_path(@camper)
    else
      render :new
    end
  end

  private

  def camper_params
    params.require(:camper).permit(:name, :description, :price)
    #:review
  end
end
