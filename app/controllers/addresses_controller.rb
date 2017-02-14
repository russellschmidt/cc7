class AddressesController < ApplicationController

  def new
    @address = Address.new
  end

  def create
    @addressable = find_addressable
    @address = addressable.address.build(address_params)
    if @address.save
      flash[:notice] = 'Created address successfully'
      redirect_to partners_path
    else
      flash[:notice] = 'Save error, please try again'
      render :new
    end
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
end
