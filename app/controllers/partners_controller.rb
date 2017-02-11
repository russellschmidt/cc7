class PartnersController < ApplicationController
  before_action :authenticate_admin!, except: [:index, :show]

  def index
    @partners = Partner.all
  end

  def show
    @partner = Partner.friendly.find(params[:id])
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      flash[:notice] = 'Created partner successfully'
      redirect_to partners_path
    else
      flash[:notice] = 'Save error, please try again'
      render :new
    end
  end

  def edit
    @partner = Partner.friendly.find(params[:id])
  end

  def update
    @partner = Partner.friendly.find(params[:id])
    if @partner.update_attributes(partner_params)
      flash[:notice] = 'Updated partner successfully'
      redirect_to partners_path
    else
      flash[:notice] = 'Save error, please try again'
      render :edit
    end
  end

  def destroy
    Partner.friendly.find(params[:id]).destroy
    flash[:success] = "Partner deleted"
    redirect_to partners_path
  end

  private
    def partner_params
      params.require(:partner).permit(:name, :slug, :logo_aws_url)
    end
end
