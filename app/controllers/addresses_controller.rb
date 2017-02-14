class AddressesController < ApplicationController

  def new
    @context = context
    @address = @context.addresses.new
  end

  def create
    @context = context
    @address = @context.addresses.new(address_params)

    if @address.save
      flash[:notice] = 'Created address successfully'
      redirect_to context_url(context)
    else
      flash[:notice] = "Address save error, please try again."
      render :new
    end
  end

  def edit
    @context = context
    @address = @context.addresses.find(params[:id])
  end

  def update
    @context = context
    @address = @context.addresses.find(params[:id])

    if @address.update_attributes(address_params)
      flash[:notice] = "Address successfully updated"
      redirect_to context_url(context)
    else
      flash[:notice] = "Problem updating the address. Please try again."
      render :edit
    end
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
        id = params[:admin_id]
        Admin.find(params[:admin_id])
      elsif params[:user_id]
        id = params[:user_id]
        User.find(params[:user_id])
      elsif params[:project_id]
        id = params[:project_id]
        Project.friendly.find(params[:project_id])
      elsif params[:partner_id]
        id = params[:partner_id]
        Partner.friendly.find(params[:partner_id])
      end
    end

    def context_url(context)
      if Admin === context
        admin_path(context)
      elsif User === context
        user_path(context)
      elsif Project === context
        project_path(context)
      elsif Partner === context
        partner_path(partner)
      end
    end

end
