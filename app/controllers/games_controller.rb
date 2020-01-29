class GamesController < ApplicationController
    before_action :protected_action

    def index
    end 

    def create
        game = Game.new(game_params)

        if game.save
            render json: game.to_json(:include => { :map, :hero })
        else
            render json: { errors: game.errors.full_messages }, status: 403
        end
    end 

    def update
        game = Game.find(params[:id])
        game.update(game_params)
    end 

    def destroy
        game = Game.find(params[:id])
        game.destroy
    end 

    private 

    def game_params
        params.require(:game).permit(:season_id, :map_id, :hero_id, :result, :sr)
    end 
    
end
