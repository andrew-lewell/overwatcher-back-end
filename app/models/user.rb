class User < ApplicationRecord
    has_many :seasons
    has_many :games, :through => :seasons
    has_secure_password
    validates :username, :email, :password, presence: true
    validates :username, :email, uniqueness: true

    def token
        JWT.encode({ user_id: self.id }, ENV['SECRET'])
    end 

    # def aggregate_by_hero
    #     sql = 'select 
    #     h.name,
    #     h.role,
    #     COUNT(g.result) as total_games,
    #     COUNT(case g.result when 'win' then 1 else null end) as total_wins,
    #     COUNT(case g.result when 'loss' then 1 else null end) as total_losses,
    #     COUNT(case g.result when 'draw' then 1 else null end) as total_draws,
    #     COUNT(case g.result when 'win' then 1 else null end) * 100.0 / COUNT(g.result) as win_perc,
    #     COUNT(case g.result when 'loss' then 1 else null end) * 100.0 / COUNT(g.result) as loss_perc,
    #     COUNT(case g.result when 'draw' then 1 else null end) * 100.0 / COUNT(g.result) as draw_perc
    #     from heros h 
    #     inner join games g on g.hero_id = h.id
    #     group by h.name, h.role'

    #     results_array = ActiveRecord::Base.connection.execute(sql)
    # end 

end
