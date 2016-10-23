class VehiclesController < ApplicationController
  before_action :index_filters, only: [:index]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles =
      if params[:maker_id].empty?
        Vehicle.all
      else
        Vehicle.by_maker(params[:maker_id])
      end
    .eager_load(:maker).order(:name)
  end

  private
  def index_filters
    params.fetch(:maker_id)
  end

end
