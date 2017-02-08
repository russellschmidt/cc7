class HomeController < ApplicationController
  def index
    @location = Location.first
  end
end
