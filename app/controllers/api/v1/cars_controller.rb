class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: [:show, :update, :destroy]
  # before_action only: [:show, :update, :destroy, :create]
  # GET /todos
  def index
    @cars = Car.all
    render json: @cars
  end

  # GET /cars/1
  def show
    render json: @car
  end

  # POST /cars
  def create
    @car = Car.new(car_params)
    if @car.save
      render json: @car, status: :created, location: api_v1_cars_path(@car)
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      head :no_content
      render json: @car
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cars/1
  def destroy
    @car.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_car
    @car = Car.find(params[:id])
  end

  # Only allow a list of trusted parameters through.++++++
  def car_params
    params.require(:car).permit(:name, :image_data)
  end
end
