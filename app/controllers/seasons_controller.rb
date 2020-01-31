class SeasonsController < ApplicationController
    before_action :protected_action, except: :index

    def index
        seasons = Season.all 

        render json: seasons
    end 

    def show
        season = Season.find(params[:id])
        render json: season
    end

    def create
        season = Season.create(season_params)
        season.update(user: @current_user)

        if season.valid? 
            render json: season
        else
            render json: { errors: season.errors.full_messages }, status: 403
        end
    end 

    # def update 
    # end

    # def destroy
    # end 

    private 

    def season_params
        params.require(:season).permit(:season, :user_id)
    end 
end
