require 'rails_helper'

RSpec.describe Location, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:location)).to be_valid
  end

  it "is valid with valid attributes" do
    expect(Location.new(name:"Los Angeles", slug: "los-angeles")).to be_valid
  end

  it "is not valid without a name" do
    loc = Location.new(name: nil, slug: 'some-url')
    expect(loc).to_not be_valid
  end

  describe "disallow duplicate records in Location" do
    before :each do
      @loc1 = Location.new(name:"Cincinatti")
      @loc2 = Location.new(name:"Cincinatti")
    end

    context "duplicate names" do
      it "does not allow duplicate names in records" do
        expect(@loc2.id).to be_nil
      end
    end

    context "potentially duplicate slugs handled by friendly_id" do
      it "does not allow duplicate slugs in records" do
        expect(@loc2.slug).to be_nil
      end
    end
  end

end
