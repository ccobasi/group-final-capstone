class Api::V1::CarTypesController < ApplicationController
    before_action :set_car_type, only: [:show, :update, :destroy]
    # GET /car_types
    def index
      @car_types = CarType.all
      render json: @car_types
    end

    # GET /cars_type/1
  def show
    render json: @car_type
  end
  # POST /car_type
  def create
    @car_type = CarType.new(car_type_params)
    if @car_type.save
      render json: @car_type, status: :created, location: api_v1_car_types_path(@car_type)
    else
      render json: @car_type.errors, status: :unprocessable_entity
    end
  end
  # PATCH/PUT /car_type/1
  def update
    if @car_type.update(car_type_params)
      render json: @car_type
    else
      render json: @car_type.errors, status: :unprocessable_entity
    end
  end
  # DELETE /car_type/1
  def destroy
    @car_type.destroy
  end
  private
  #Use callbacks to share common setup or constraints between actions.
  def set_car_type
    @car_type = CarType.find(params[:id])
  end
  # Only allow a list of trusted parameters through.++++++
  def car_type_params
    params.require(:car_type).permit(:make, :model, :car_id)
  end
end