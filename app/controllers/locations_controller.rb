class LocationsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @locations = Location.all
  end

  def show
    @location = Location.friendly.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      flash[:notice] = 'Created location successfully'
      redirect_to locations_path
    else
      flash[:notice] = 'Save error, please try again'
      render :new
    end
  end

  def edit
    @location = Location.friendly.find(params[:id])
  end

  def update
    @location = Location.friendly.find(params[:id])
    if @location.update_attributes(location_params)
      flash[:notice] = 'Updated location successfully'
      redirect_to locations_path
    else
      flash[:notice] = 'Save error, please try again'
      render :edit
    end
  end

  def destroy
    Location.friendly.find(params[:id]).destroy
    flash[:success] = "Location deleted"
    redirect_to locations_path
  end

  private
    def location_params
      params.require(:location).permit(:name, :slug)
    end

end
