class CampersController < ApplicationController
  def index
    @campers = policy_scope(Camper)
  end

  def show
    @camper = Camper.find(params[:id])
    authorize @camper
  end

  def new
    @camper = Camper.new
    authorize @camper
  end

  def create
    @camper = Camper.new(camper_params)
    @camper.user = current_user
    authorize @camper
    if @camper.save!
      redirect_to camper_path(@camper)
    else
      render :new
    end
  end

  def edit
    @camper = Camper.find(params[:id])
    authorize @camper
  end

  def update
    @camper = Camper.find(params[:id])
    @camper.update(camper_params)
    authorize @camper

    redirect_to camper_path
  end

  private

  def camper_params
    params.require(:camper).permit(:name, :image, :description, :price)
    #:review
  end
end
