class Api::V1::CitiesController < ApplicationController
    before_action :set_city, only: [:show, :update, :destroy]
    # before_action only: [:show, :update, :destroy, :create]
    # GET /todos
    def index
      @cities = City.all
      render json: @cities
    end
  
    # GET /cars/1
    def show
      render json: @city
    end
  
    # POST /cars
    def create
      @city = City.new(city_params)
      if @city.save
        render json: @city, status: :created, location: api_v1_cities_path(@city)
      else
        render json: @city.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /cars/1
    def update
      if @city.update(city_params)
        head :no_content
        render json: @city
      else
        render json: @city.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /cars/1
    def destroy
      @city.destroy
      head :no_content
    end
  
    private
  
    # Use callbacks to share common setup or constraints between actions.
    def set_city
      @city = City.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.++++++
    def city_params
      params.require(:city).permit(:name)
    end
end
