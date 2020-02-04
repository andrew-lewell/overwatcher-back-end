class MapsController < ApplicationController
    # before_action :protected_action

    def index 
        maps = Map.all 

        render json: maps 
    end 

    def show
        map = Map.find(params[:id])
        render json: map
    end 


end
