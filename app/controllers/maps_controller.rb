class MapsController < ApplicationController
    before_action :protected_action

    def index 
        maps = Map.all 

        render json: maps 
    end 

    def show
        map = Map.find(params[:id])
        render json: map
    end 

    def winpercbymap
        maps = Map.find_by_sql("select
            m.map,
            COUNT(case g.result when 'win' then 1 else null end) as total_wins,
            COUNT(case g.result when 'loss' then 1 else null end) as total_losses,
            COUNT(case g.result when 'draw' then 1 else null end) as total_draws,
            COUNT(g.result) as total_games,
            ROUND(COUNT(case g.result when 'win' then 1 else null end) * 100.0 / COUNT(g.result), 2) as win_perc,
            ROUND(COUNT(case g.result when 'loss' then 1 else null end) * 100.0 / COUNT(g.result), 2) as loss_perc,
            ROUND(COUNT(case g.result when 'draw' then 1 else null end) * 100.0 / COUNT(g.result), 2) as draw_perc
            from maps m 
            inner join games g on g.map_id = m.id
            inner join seasons s on s.id = g.season_id
            where s.user_id = #{@current_user.id}
            group by m.map
            order by win_perc desc")

        if maps 
            render json: maps 
        else
            render json: { errors: maps.errors.full_messages }, status: 403
        end
    end

    def winpercbymaptype
        maps = Map.find_by_sql("select
            m.map_type,
            COUNT(case g.result when 'win' then 1 else null end) as total_wins,
            COUNT(case g.result when 'loss' then 1 else null end) as total_losses,
            COUNT(case g.result when 'draw' then 1 else null end) as total_draws,
            COUNT(g.result) as total_games,
            ROUND(COUNT(case g.result when 'win' then 1 else null end) * 100.0 / COUNT(g.result), 2) as win_perc,
            ROUND(COUNT(case g.result when 'loss' then 1 else null end) * 100.0 / COUNT(g.result), 2) as loss_perc,
            ROUND(COUNT(case g.result when 'draw' then 1 else null end) * 100.0 / COUNT(g.result), 2) as draw_perc
            from maps m 
            inner join games g on g.map_id = m.id
            inner join seasons s on s.id = g.season_id
            where s.user_id = #{@current_user.id}
            group by m.map_type
            order by win_perc desc")

        if maps 
            render json: maps 
        else
            render json: { errors: maps.errors.full_messages }, status: 403
        end
    end


end
