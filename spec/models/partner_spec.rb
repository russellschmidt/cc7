require 'rails_helper'

RSpec.describe Partner, type: :model do
  it "has a valid factory" do
    expect(FactoryGirl.create(:partner)).to be_valid
  end

  it "is valid with valid attributes" do
    expect(Partner.new(name:"Ocean Friends", slug: "ocean-friends",
      logo_aws_url: 'http://www.example.com/aws/logo.jpg')).to be_valid
  end

  it "is not valid without a name" do
    loc = Partner.new(name: nil, slug: 'some-url', logo_aws_url: 'http://www.example.com/aws/logo.jpg')
    expect(loc).to_not be_valid
  end

  describe "disallow duplicate records in Partner" do
    before :each do
      @partner1 = Partner.new(name:"Ocean Friends",
      logo_aws_url: 'http://www.example.com/aws/logo.jpg')
      @partner2 = Partner.new(name:"Ocean Friends",
      logo_aws_url: 'http://www.example.com/aws/logo.jpg')
    end

    context "duplicate names" do
      it "does not allow duplicate names in records" do
        expect(@partner2.id).to be_nil
      end
    end

    context "potentially duplicate slugs handled by friendly_id" do
      it "does not allow duplicate slugs in records" do
        expect(@partner2.slug).to be_nil
      end
    end
  end

end
