require 'rails_helper'

describe LocationsController do

  describe "GET actions" do
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


  # describe "GET #new" do
  #   it "assigns a new location to @location"
  #   it "renders the :new template"
  # end

  # describe "POST #create" do
  #   context "with valid attributes" do
  #     it "saves the location to the database"
  #     it "redirects to locations#index"
  #   end

  #   context "with invalid attributes" do
  #     it "does not save the new contact in the database"
  #     it "re-renders the :new template"
  #   end
  # end

end
