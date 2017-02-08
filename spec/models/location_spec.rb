require 'rails_helper'

RSpec.describe Location, type: :model do
  it "is valid with valid attributes" do
    expect(Location.new(name:"Los Angeles")).to be_valid
  end

  it "is not valid without a name" do
    loc = Location.new(name:nil)
    expect(loc).to_not be_valid
  end
end
