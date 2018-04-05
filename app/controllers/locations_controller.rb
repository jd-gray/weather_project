class LocationsController < ApplicationController
  before_action :set_location, only: :destroy

  def index
    @locations = Location.where(user_id: current_user.id).order("created_at desc")
    gon.locations = @locations
  end

  def new
    @location = Location.new
  end

  def create
    Locations::LocationService.new(zip_code, current_user.id).create_location
    redirect_to locations_path

  rescue StandardError
    flash[:alert] = "Whoops something went wrong, check your zip code"
  end

  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:zip_code)
  end

  def zip_code
    location_params['zip_code']
  end
end
