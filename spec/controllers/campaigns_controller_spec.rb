require 'rails_helper'

def admin_sign_in
  admin = FactoryGirl.create(:admin)
  sign_in admin
end

describe CampaignsController do

  describe "GET index and show actions" do
    before :each do
      @location = FactoryGirl.create(:location)
      @project = FactoryGirl.create(:project, location_id: @location.id)
      @campaign = FactoryGirl.create(:campaign, project_id: @project.id)
    end

    context "GET #index" do
      it "populates a list of campaigns" do
        get :index, location_id: @location, project_id: @project
        expect(assigns(:campaigns)).to eq(@project.campaigns)
      end

      it "renders the :index view" do
        get :index, location_id: @location, project_id: @project
        expect(response).to render_template(:index)
      end
    end

    context "GET #show" do
      it "assigns the requested project to @campaign" do
        get :show, params: {id: @campaign.id, project_id: @project, location_id: @location}
        expect(assigns(:campaign)).to eq(@campaign)
      end

      it "renders the :show template" do
        get :show, params: {id: @campaign.id, project_id: @project, location_id: @location}
        expect(response).to render_template(:show)
      end
    end
  end

  describe "GET #new with signed in admin" do
    before :each do
      @location = FactoryGirl.create(:location)
      @project = FactoryGirl.create(:project, location_id: @location.id)
      @campaign = FactoryGirl.create(:campaign, project_id: @project.id)
    end

    context "NEW action" do
      it "renders the :new template" do
        admin_sign_in
        get :new, project_id: @project, location_id: @location
        expect(response).to render_template(:new)
      end
    end
  end

end
