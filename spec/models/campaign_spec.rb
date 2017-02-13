require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:campaign)).to be_valid
  end

  it "is valid with valid attributes" do
    expect(Campaign.new(name:"Los Angeles",
      slug: "los-angeles",
      project_id: 1,
      description:"very nice campaign!",
      dollar_goal: 1002.12,
      start_date: Time.current,
      end_date: Time.current + 1.month,
      time_zone: "Tijuana",
      active?: true)).to be_valid
  end

  it "is invalid with invalid :name attribute" do
    expect(Campaign.new(name: nil,
      slug: "los-angeles",
      project_id: 1,
      description:"very nice campaign!",
      dollar_goal: 1002.12,
      start_date: Time.current,
      end_date: Time.current + 1.month,
      time_zone: "Tijuana",
      active?: true)).to_not be_valid
  end

  describe "disallow duplicate records in Campaign" do
    before :each do
      @campaign1 = Campaign.new(name:"Los Angeles",
        project_id: 1,
        description:"very nice campaign!",
        dollar_goal: 1002.12,
        start_date: Time.current,
        end_date: Time.current + 1.month,
        time_zone: "Tijuana",
        active?: true)
      @campaign2 = Campaign.new(name:"Los Angeles",
        project_id: 1,
        description:"very nice campaign!",
        dollar_goal: 1002.12,
        start_date: Time.current,
        end_date: Time.current + 1.month,
        time_zone: "Tijuana",
        active?: true)
    end

    context "duplicate names" do
      it "does not allow duplicate names in records" do
        expect(@campaign2.id).to be_nil
      end
    end

    context "potentially duplicate slugs handled by friendly_id" do
      it "does not allow duplicate slugs in records" do
        expect(@campaign2.slug).to be_nil
      end
    end
  end
end
