require 'rails_helper'
# include Devise::Test::ControllerHelpers

def admin_sign_in
  admin = FactoryGirl.create(:admin)
  sign_in admin
end

describe LocationsController do

  describe "GET index and show actions" do
    before :each do
      @location = FactoryGirl.create(:location)
    end

    context "GET #index" do
      it "populates a list of contacts" do
        get :index
        expect(assigns(:locations)).to eq([@location])
      end

      it "renders the :index view" do
        get :index
        expect(response).to render_template(:index)
      end
    end

    context "GET #show" do
      it "assigns the requested location to @location" do
        get :show, params: {id: @location.id}
        expect(assigns(:location)).to eq(@location)
      end

      it "renders the :show template" do
        get :show, params: {id: @location.id}
        expect(response).to render_template(:show)
      end
    end
  end


  describe "GET #new with signed in admin" do
    it "renders the :new template" do
      admin_sign_in
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create with signed in admin" do
    before :each do
      admin_sign_in
    end

    context "with valid attributes" do
      it "creates a new contact" do
        expect{
          post :create, location: FactoryGirl.attributes_for(:location)
        }.to change(Location, :count).by(1)
      end

      it "redirects to locations#index" do
        post :create, location: FactoryGirl.attributes_for(:location)
        expect(response).to redirect_to locations_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database" do
        expect {
          post :create, location: FactoryGirl.attributes_for(:badplace)
        }.to_not change(Location, :count)
      end

      it "re-renders the :new template" do
        post :create, location: FactoryGirl.attributes_for(:badplace)
        expect(response).to render_template :new
      end
    end
  end

end
