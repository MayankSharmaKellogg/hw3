class PlacesController < ApplicationController
 
  def index
    @places = Place.all
  end

  # check
  def show
    @place = Place.find_by("id" => params["id"])
  end


  def new
    @place = Place.new
  end


  def create
    @place = Place.new
    @place["name"] = params["place"]["name"]
    
    @place.save
    redirect_to "/places"
  end

end