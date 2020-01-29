class SeasonsController < ApplicationController
    before_action :protected_action, except: :index

    def index
        seasons = Season.all 

        render json: seasons.to_json(:include => { :games })
    end 

    def create
        season = Season.create(season_params)
        season.update(user: @current_user)

        if season.valid? 
            render json: season, include: [:games]
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
