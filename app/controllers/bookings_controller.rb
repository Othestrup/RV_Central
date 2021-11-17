class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @camper = @booking.camper
  end

  def new
    @camper = Camper.find(params[:camper_id])
    @booking = Booking.new
  end

  def create
    @camper = Camper.find(params[:camper_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.camper = @camper
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
