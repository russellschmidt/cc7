require 'rails_helper'

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
      it "populates a list of locations" do
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

  describe "PUT update with signed in admin" do
    before :each do
      admin_sign_in
      @location = FactoryGirl.create(:location, name: "San Diego")
    end

    context "valid attributes" do
      it "located the requested location" do
        put :update, id: @location, location: FactoryGirl.attributes_for(:location)
        expect(assigns(:location)).to eq(@location)
      end

      it "changes @location's attributes" do
        new_name = "San Clamato"
        put :update, id: @location, location: FactoryGirl.attributes_for(:location, name: new_name)
        @location.reload
        expect(@location.name).to eq(new_name)
      end

      it "redirects to the updated location" do
        put :update, id: @location, location: FactoryGirl.attributes_for(:location)
        expect(response).to redirect_to locations_path
      end
    end

    context "invalid attributes" do
      it "locates the requested @location" do
        put :update, id: @location, location: FactoryGirl.attributes_for(:badplace)
        expect(assigns(:location)).to eq(@location)
      end

      it "does not change @location's attributes" do
        put :update, id: @location,
          location: FactoryGirl.attributes_for(:location, name: nil)
        @location.reload
        expect(@location.name).to_not eq(nil)
      end

      it "re-renders the edit method" do
        put :update, id: @location, location: FactoryGirl.attributes_for(:badplace)
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      admin_sign_in
      @location = FactoryGirl.create(:location)
    end

    it "deletes the location" do
      expect{
        delete :destroy, id: @location
      }.to change(Location,:count).by(-1)
    end

    it "redirects to location#index" do
      delete :destroy, id: @location
      expect(response).to redirect_to locations_path
    end
  end

end
