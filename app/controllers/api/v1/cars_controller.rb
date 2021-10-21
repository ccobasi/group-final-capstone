class Api::V1::CarsController < ApplicationController
  before_action :set_rental, only: [:show, :update, :destroy]
  # GET /todos
  def index
    @cars = Car.all
    render json: @cars
  end
end
