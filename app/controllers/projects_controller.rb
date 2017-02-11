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
      @location = Location.friendly.find(params[:location_id])
    end

    def project_params
      params.require(:project).permit(:name, :slug, :blurb, :description,
        :location_id, :partner_id)
    end

end
