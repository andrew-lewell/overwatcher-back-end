class HerosController < ApplicationController
    # before_action :protected_action

    def index 
        heros = Hero.all 

        render json: heros 
    end 

    def show
        hero = Hero.find(params[:id])
        render json: hero
    end 

    def herostats
        heros = Hero.find_by_sql("select 
            h.id,
            h.name,
            h.role,
            COUNT(case g.result when 'win' then 1 else null end) as total_wins,
            COUNT(case g.result when 'loss' then 1 else null end) as total_losses,
            COUNT(case g.result when 'draw' then 1 else null end) as total_draws,
            COUNT(g.result) as total_games,
            ROUND(COUNT(case g.result when 'win' then 1 else null end) * 100.0 / COUNT(g.result), 2) as win_perc,
            ROUND(COUNT(case g.result when 'loss' then 1 else null end) * 100.0 / COUNT(g.result), 2) as loss_perc,
            ROUND(COUNT(case g.result when 'draw' then 1 else null end) * 100.0 / COUNT(g.result), 2) as draw_perc
            from heros h 
            inner join games g on g.hero_id = h.id
            group by h.name, h.id, h.role")

        if heros 
            render json: heros 
        else
            render json: { errors: heros.errors.full_messages }, status: 403
        end
    end

    # def herostatsbymap(map_id)
    #     heros = Hero.find_by_sql("select 
    #         h.id,
    #         h.name,
    #         h.role,
    #         COUNT(g.result) as total_games,
    #         COUNT(case g.result when 'win' then 1 else null end) as total_wins,
    #         COUNT(case g.result when 'loss' then 1 else null end) as total_losses,
    #         COUNT(case g.result when 'draw' then 1 else null end) as total_draws,
    #         COUNT(case g.result when 'win' then 1 else null end) * 100.0 / COUNT(g.result) as win_perc,
    #         COUNT(case g.result when 'loss' then 1 else null end) * 100.0 / COUNT(g.result) as loss_perc,
    #         COUNT(case g.result when 'draw' then 1 else null end) * 100.0 / COUNT(g.result) as draw_perc
    #         from heros h 
    #         inner join games g on g.hero_id = h.id
    #         where g.map_id = #{map_id}
    #         group by h.name, h.id, h.role")

    #     if heros 
    #         render json: heros 
    #     else
    #         render json: { errors: heros.errors.full_messages }, status: 403
    #     end
    # end 
end
