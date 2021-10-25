class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]
  before_action :check_owner, only: %i[update destroy]
    def index
      @users = User.all
  
      render json: @users
    end

    # POST /users
    def create
      @user = User.create!(user_params)
      json_response(@user, :created)
    end

    def update
      if @user.update(user_params)
        render json: @user, status: :ok
      else 
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    def show 
      render json: @user
    end
  
    # DELETE /users/:id
    def destroy
      @user = User.find(params[:id])
      @user.destroy if @user.present?
      head :no_content
    end
  
    private
  
    def user_params
      # whitelist params
      params.require(:user).permit(:username, :email, :password_digest)
    end
  
    def set_user
      @user = User.find(params[:id])
    end

    def check_owner
      head :forbidden unless @user.id == current_user&.id
    end
  end