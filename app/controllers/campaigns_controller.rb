class CampaignsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]
  before_action :find_location, :find_project

  def index
    @campaigns = @project.campaigns.all
  end

  def show
    @campaign = @project.campaigns.friendly.find(params[:id])
  end

  def new
    @campaign = @project.campaigns.new
  end

  def create
    @campaign = @project.campaigns.build(campaign_params)
    if @campaign.save
      flash[:notice] = "Successfully created project."
      redirect_to location_project_campaigns_path
    else
      flash[:notice] = "Create error, please try again."
      render :new
    end
  end

  def edit
    @campaign = @project.campaigns.friendly.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    def campaign_params
      params.require(:campaign).permit(:name, :slug, :description, :dollar_goal, :start_date, :end_date, :time_zone, :active?, :project_id)
    end

    def find_location
      @location = Location.friendly.find(params[:location_id])
    end

    def find_project
      if @location.nil?
        find_location
      end
      @project = @location.projects.friendly.find(params[:project_id])
    end
end
