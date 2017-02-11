class ProjectsController < ApplicationController
  before_filter :find_location, only: [:index, :show]

  def index
    @projects = @location.projects.all
  end

  def show
    @project = @location.projects.friendly.find(params[:id])
  end

  private
    def find_location
      @location = Location.friendly.find(params[:location_id]) unless params[:location_id].nil?
    end

    def project_params
    end

end
