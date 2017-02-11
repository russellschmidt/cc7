class HomeController < ApplicationController
  def index
    @location = Location.first
    @partners = Partner.all
  end
end
