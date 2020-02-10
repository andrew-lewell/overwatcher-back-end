class SeasonsController < ApplicationController
    before_action :protected_action

    def index
        # byebug
        seasons_ids = @current_user.seasons.select(:id)

        render json: seasons_ids.to_json
    end 

    def show
        season = Season.find(params[:id])
        render json: season
    end

    def create
        season = Season.new
        season.season = params[:season]
        season.user = @current_user

        if season.save
            render json: season
        else
            render json: { errors: season.errors.full_messages }, status: 403
        end
    end 

    # def update 
    # end

    # def destroy
    # end 

    # private 

    def season_params
        params.require(:season).permit(:season, :user_id)
    end 
end
