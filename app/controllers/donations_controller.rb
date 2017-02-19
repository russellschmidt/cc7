class DonationsController < ApplicationController
  before_action :set_donation, only: [:show, :edit, :update, :destroy]

  def index
    @donations = Donation.all
  end

  def show
  end

  def new
    @donation = Donation.new
  end

  def edit
  end

  def create
    if stripe_token = params[:stripe_token]
      if current_donor.do_donor_transaction(params[:payment_type], params[:amount], stripe_token)
        @donation = Donation.new(donation_params)
        if @donation.save
          redirect_to @donation, notice: 'Card charged successfully! Thank you.'
        else
          render :new
        end
      else
        flash[:alert] = 'Error occurred during processing - please check your inputted payment information'
      end
    else
      flash[:alert] = "Form was not submitted correctly. Please try again."
    end

    redirect_to new_donation_path
  end

  def update
    if @donation.update(donation_params)
      redirect_to @donation, notice: 'Donation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @donation.destroy
    respond_to do |format|
      redirect_to donations_url, notice: 'Donation was successfully destroyed.', data: {confirm: "Are you sure you want to delete?"}
    end
  end

  private
    def set_donation
      @donation = Donation.find(params[:id])
    end

    def donation_params
      params.fetch(:donation, {})
    end
end
