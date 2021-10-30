class Api::V1::ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show update destroy]
  before_action :check_login, only: %i[create]
  before_action :check_owner, only: %i[update destroy]
  # GET /reservastions
  def index
    @reservations = Reservation.all
    render json: @reservations
  end

  # GET /reservation/1
  def show
    render json: @reservation
  end

  # POST /reservation
  def create
    reservation = current_user.reservations.build(reservation_params)
    if reservation.save
      render json: reservation, status: :created, location: api_v1_reservations_path(@reservation)
    else
      render json: reservation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /reservation/1
  def update
    if @reservation.update(reservation_params)
      render json: @reservation
    else
      render json: @reservation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reservation/1
  def destroy
    @reservation.destroy
    head 204
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.++++++
  def reservation_params
    params.require(:reservation).permit(:reserve, :date, :car_id, :city_id)
  end
end
