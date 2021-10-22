class PagesController < ApplicationController
  def home
    render json: 'Welcome to Car rentals'
  end
end
