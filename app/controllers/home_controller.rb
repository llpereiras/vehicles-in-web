class HomeController < ApplicationController
  def index
    # Itera no resultado e grava as marcas que ainda não estão persistidas
    # json.each do |make_params|
    #   if Make.where(name: make_params["Nome"]).size == 0
    #     Make.create(name: make_params["Nome"], webmotors_id: make_params["Id"])
    #   end
    # end
  end
  
end
