# app/controllers/strolls_controller.rb
class StrollsController < ApplicationController
  before_action :set_stroll, only: [:show, :update, :destroy]

  # GET /strolls
  def index
   # get current user strolls
   @strolls = current_user.strolls
   json_response(@strolls)
  end

  # POST /strolls
  def create
    # create strolls belonging to current user
    @stroll = current_user.strolls.create!(stroll_params)
    json_response(@stroll, :created)
  end

  # GET /strolls/:id
  def show
    json_response(@stroll)
  end

  # PUT /strolls/:id
  def update
    @stroll.update(stroll_params)
    head :no_content
  end

  # DELETE /strolls/:id
  def destroy
    @stroll.destroy
    head :no_content
  end

  private

  # remove `created_by` from list of permitted parameters
  def stroll_params
    params.permit(:title)
  end

  def set_stroll
    @stroll = Stroll.find(params[:id])
  end
end
