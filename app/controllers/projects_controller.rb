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
      flash[:notice] = "Successfully created project."
      redirect_to location_projects_path
    else
      flash[:notice] = "Create error, please try again."
      render :new
    end
  end

  def edit
    @project = @location.projects.friendly.find(params[:id])
  end

  def update
    @project = @location.projects.friendly.find(params[:id])
    if @project.update_attributes(project_params)
      flash[:notice] = 'Updated partner successfully'
      redirect_to location_projects_path
    else
      flash[:notice] = 'Save error, please try again'
      render :edit
    end
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
