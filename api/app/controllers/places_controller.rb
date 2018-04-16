# app/controllers/places_controller.rb
class PlacesController < ApplicationController
  before_action :set_stroll
  before_action :set_stroll_place, only: [:show, :update, :destroy]

  # GET /strolls/:stroll_id/places
  def index
    json_response(@stroll.places)
  end

  # GET /strolls/:stroll_id/places/:id
  def show
    json_response(@place)
  end

  # POST /strolls/:stroll_id/places
    def create
      @stroll.places.create!(place_params)
      json_response(@stroll, :created)
    end

    # PUT /strolls/:stroll_id/places/:id
    def update
      @place.update(place_params)
      head :no_content
    end


  # DELETE /strolls/:stroll_id/places/:id
  def destroy
    @place.destroy
    head :no_content
  end

  private

  def place_params
    params.permit(:name, :done)
  end


  def set_stroll
    @stroll = Stroll.find(params[:stroll_id])
  end

  def set_stroll_place
    @place = @stroll.places.find_by!(id: params[:id]) if @stroll
  end
end
