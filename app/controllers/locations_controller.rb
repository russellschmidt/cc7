class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end

  def show
    @location = Location.friendly.find(params[:id])
  end
end
