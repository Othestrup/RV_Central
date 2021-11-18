class CampersController < ApplicationController
  def index
    @campers = Camper.all
  end

  def show
    @camper = Camper.find(params[:id])
    @markers = [{
      lat: @camper.latitude,
      lng: @camper.longitude
    }]
  end

  def new
    @camper = Camper.new
  end

  def create
    @camper = Camper.new(camper_params)
    @camper.user = current_user
    if @camper.save!
      redirect_to camper_path(@camper)
    else
      render :new
    end
  end

  private

  def camper_params
    params.require(:camper).permit(:name, :address, :image, :description, :price)
    #:review
  end
end
