class PagesController < ApplicationController
  def home
    render json: { status: 'Welcome...' }
  end
end
