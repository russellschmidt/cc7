class CampaignsController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @campaigns = Campaign.all
  end

  def show
    @campaign = Campaign.friendly.find(params[:id])
  end

  def new
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

end
