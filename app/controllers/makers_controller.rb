class MakersController < ApplicationController

  # GET /makers
  # GET /makers.json
  def index
    @makers = Maker.all.order(:name)
  end

end
