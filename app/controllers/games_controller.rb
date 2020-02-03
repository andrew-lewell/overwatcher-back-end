class GamesController < ApplicationController
    before_action :protected_action

    def index
        games = Game.all

        render json: games
    end 

    def show
        game = Game.find(params[:id])
        render json: game
    end

    def create
        game = Game.new(game_params)

        if game.save
            render json: game
        else
            render json: { errors: game.errors.full_messages }, status: 403
        end
    end 

    def update
        game = Game.find(params[:id])

        if game
            game.update(game_params)
            render json: game
        else 
            render json: { errors: game.errors.full_messages }, status: 403
        end
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
