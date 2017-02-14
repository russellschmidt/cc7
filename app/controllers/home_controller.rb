class HomeController < ApplicationController
  def index
    @location = Location.first
    @locations = Location.all
    @partners = Partner.all
  end
end
