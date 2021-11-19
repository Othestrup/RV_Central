class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @camper = @booking.camper
    authorize @booking
  end

  def new
    @camper = Camper.find(params[:camper_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @camper = Camper.find(params[:camper_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.camper = @camper
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @camper = Camper.find(params[:camper_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.camper = @camper
    authorize @booking
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
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
