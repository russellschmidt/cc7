require 'rails_helper'

def admin_sign_in
  admin = FactoryGirl.create(:admin)
  sign_in admin
end

describe ProjectsController do

  describe "GET index and show actions" do
    before :each do
      @location = FactoryGirl.create(:location)
      @project = FactoryGirl.create(:project, location_id: @location.id)
    end

    context "GET #index" do
      it "populates a list of projects" do
        get :index, location_id: @location
        expect(assigns(:projects)).to eq(@location.reload.projects)
      end

      it "renders the :index view" do
        get :index, location_id: @location
        expect(response).to render_template(:index)
      end
    end

    context "GET #show" do
      it "assigns the requested project to @project" do
        get :show, params: {id: @project.id, location_id: @location}
        expect(assigns(:project)).to eq(@project)
      end

      it "renders the :show template" do
        get :show, params: {id: @project.id, location_id: @location}
        expect(response).to render_template(:show)
      end
    end
  end

  describe "GET #new with signed in admin" do
    before :each do
      @location = FactoryGirl.create(:location)
      @project = FactoryGirl.create(:project, location_id: @location.id)
    end

    context "NEW action" do
      it "renders the :new template" do
        admin_sign_in
        get :new, location_id: @location
        expect(response).to render_template(:new)
      end
    end
  end

  describe "POST #create with signed in admin" do
    before :each do
      admin_sign_in
      @location = FactoryGirl.create(:location)
      @project = FactoryGirl.create(:project, location_id: @location.id)
    end

    context "with valid attributes" do
      it "creates a new contact" do
        expect{
          post :create, location_id: @location, project: FactoryGirl.attributes_for(:project)
        }.to change(Project, :count).by(1)
      end

      it "redirects to project#index" do
        post :create, location_id: @location, project: FactoryGirl.attributes_for(:project)
        expect(response).to redirect_to location_projects_path
      end
    end

    context "with invalid attributes" do
      it "does not save the new contact in the database" do
        expect {
          post :create, location_id: @location, project: FactoryGirl.attributes_for(:badproject)
        }.to_not change(Project, :count)
      end

      it "re-renders the :new template" do
        post :create, location_id: @location, project: FactoryGirl.attributes_for(:badproject)
        expect(response).to render_template :new
      end
    end
  end

  # describe "PUT update with signed in admin" do
  #   before :each do
  #     admin_sign_in
  #     @partner = FactoryGirl.create(:partner, name: "San Diego Service Friends")
  #   end

  #   context "valid attributes" do
  #     it "located the requested partner" do
  #       put :update, id: @partner, partner: FactoryGirl.attributes_for(:partner)
  #       expect(assigns(:partner)).to eq(@partner)
  #     end

  #     it "changes @partner's attributes" do
  #       new_name = "San Clamato Service Corps"
  #       put :update, id: @partner, partner: FactoryGirl.attributes_for(:partner, name: new_name)
  #       @partner.reload
  #       expect(@partner.name).to eq(new_name)
  #     end

  #     it "redirects to the updated partner" do
  #       put :update, id: @partner, partner: FactoryGirl.attributes_for(:partner)
  #       expect(response).to redirect_to partners_path
  #     end
  #   end

  #   context "invalid attributes" do
  #     it "locates the requested @partner" do
  #       put :update, id: @partner, partner: FactoryGirl.attributes_for(:badpartner)
  #       expect(assigns(:partner)).to eq(@partner)
  #     end

  #     it "does not change @partner's attributes" do
  #       put :update, id: @partner,
  #         partner: FactoryGirl.attributes_for(:partner, name: nil)
  #       @partner.reload
  #       expect(@partner.name).to_not eq(nil)
  #     end

  #     it "re-renders the edit method" do
  #       put :update, id: @partner, partner: FactoryGirl.attributes_for(:badpartner)
  #       expect(response).to render_template :edit
  #     end
  #   end
  # end

  # describe 'DELETE destroy' do
  #   before :each do
  #     admin_sign_in
  #     @partner = FactoryGirl.create(:partner)
  #   end

  #   it "deletes the partner" do
  #     expect{
  #       delete :destroy, id: @partner
  #     }.to change(Partner,:count).by(-1)
  #   end

  #   it "redirects to partner#index" do
  #     delete :destroy, id: @partner
  #     expect(response).to redirect_to partners_path
  #   end
  # end

end
