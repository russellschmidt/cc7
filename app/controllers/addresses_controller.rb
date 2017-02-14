class AddressesController < ApplicationController

  def new
    @context = context
    @address = @context.addresses.new
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
    def address_params
      params.require(:address).permit(:street1, :street2, :city, :state, :zip,
        :phone, :email, :homepage)
    end

    def find_addressable
      params.each do |name, value|
        if name =~ /(.+)_id$/
          return $1.classify.constantize.find(value)
        end
      end
    end

    def context
      if params[:admin_id]
        Admin.find(params[:admin_id])

end
