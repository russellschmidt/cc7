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
    @campaign = @project.campaigns.friendly.find(params[:id])
    if @campaign.update_attributes(campaign_params)
      flash[:notice] = 'Updated campaign successfully'
      redirect_to location_project_campaigns_path
    else
      flash[:notice] = 'Save error, please try again'
      render :edit
    end
  end

  def destroy
    Campaign.friendly.find(params[:id]).destroy
    flash[:success] = "Campaign deleted"
    redirect_to location_project_campaigns_path
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
