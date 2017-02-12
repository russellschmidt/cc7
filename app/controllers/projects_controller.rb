class ProjectsController < ApplicationController
  before_filter :find_location
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @projects = @location.projects.all
  end

  def show
    @project = @location.projects.friendly.find(params[:id])
  end

  def new
    @project = @location.projects.new
  end

  def create
    @project = @location.projects.build(project_params)
    if @project.save
      redirect_to location_projects_path, notice: "Successfully created project."
    else
      render action: "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
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
