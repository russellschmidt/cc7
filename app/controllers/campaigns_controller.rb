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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def campaign_params

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
