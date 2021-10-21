class Api::V1::CarsController < ApplicationController
  before_action :set_rental, only: [:show, :update, :destroy]
  # GET /todos
  def index
    @cars = Car.all
    render json: @cars
  end
  # GET /todos/1
  # def show
  #   render json: @todo
  # end
  # # POST /todos
  # def create
  #   @todo = Todo.new(todo_params)
  #   if @todo.save
  #     render json: @todo, status: :created, location: api_v1_todos_path(@todo)
  #   else
  #     render json: @todo.errors, status: :unprocessable_entity
  #   end
  # end
  # # PATCH/PUT /todos/1
  # def update
  #   if @todo.update(todo_params)
  #     render json: @todo
  #   else
  #     render json: @todo.errors, status: :unprocessable_entity
  #   end
  # end
  # # DELETE /todos/1
  # def destroy
  #   @todo.destroy
  # end
  # private
    # Use callbacks to share common setup or constraints between actions.
    # def set_todo
    #   @todo = Todo.find(params[:id])
    # end
    # # Only allow a list of trusted parameters through.++++++
    # def todo_params
    #   params.require(:todo).permit(:task)
    # end
end