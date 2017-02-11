require 'rails_helper'

RSpec.describe Project, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:project)).to be_valid
  end

  it "is valid with valid attributes" do
    expect(Project.new(name:"Clean The Tar Pits", slug: "clean-the-tar-pits",
      location_id: 1, partner_id: 1, blurb: "Scrub that saber tooth",
      description: "Got to clean that tar real nice")).to be_valid
  end

  it "is not valid without a name" do
    project = Project.new(name: nil, slug: "clean-the-tar-pits",
      location_id: 1, partner_id: 1, blurb: "Scrub that saber tooth",
      description: "Got to clean that tar real nice")
    expect(project).to_not be_valid
  end

  describe "disallow duplicate records in Project" do
    before :each do
      @project1 = Project.new(name:"Clean The Tar Pits",
      location_id: 1, partner_id: 1, blurb: "Scrub that saber tooth",
      description: "Got to clean that tar real nice")
      @project2 = Project.new(name:"Clean The Tar Pits",
      location_id: 1, partner_id: 1, blurb: "Scrub that saber tooth",
      description: "Got to clean that tar real nice")
    end

    context "duplicate names" do
      it "does not allow duplicate names in records" do
        expect(@project2.id).to be_nil
      end
    end

    context "potentially duplicate slugs handled by friendly_id" do
      it "does not allow duplicate slugs in records" do
        expect(@project2.slug).to be_nil
      end
    end
  end

end
