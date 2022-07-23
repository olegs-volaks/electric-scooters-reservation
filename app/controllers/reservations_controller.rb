class ReservationsController < ApplicationController

  def index
    @q = Reservation.ransack(params[:q])
    @q.sorts = 'id desc' if @q.sorts.empty?
    @reservations = @q.result.paginate(page: params[:page])
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    if @reservation.save
      redirect_to reservations_path, status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def reservation_params
    params.require(:reservation).permit(:employee_id, :scooter_id, :from, :to)
  end
end
