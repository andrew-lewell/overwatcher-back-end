# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Map.create([{ map: "Blizzard World", map_type: "hybrid" }, 
#     { map: "Busan", map_type: "control" },
#     { map: "Dorado", map_type: "escort" },
#     { map: "Eichenwalde", map_type: "hybrid" },
#     { map: "Hanamura", map_type: "assault" },
#     { map: "Havana", map_type: "escort" },
#     { map: "Hollywood", map_type: "hybrid" },
#     { map: "Horizon Lunar Colony", map_type: "assault" },
#     { map: "Ilios", map_type: "control" },
#     { map: "Junkertown", map_type: "escort" },
#     { map: "King's Row", map_type: "hybrid" },
#     { map: "Lijiang Tower", map_type: "control" },
#     { map: "Nepal", map_type: "control" },
#     { map: "Numbani", map_type: "hybrid" },
#     { map: "Oasis", map_type: "control" },
#     { map: "Paris", map_type: "assault" },
#     { map: "Rialto", map_type: "escort" },
#     { map: "Route 66", map_type: "escort" },
#     { map: "Temple of Anubis", map_type: "assault" },
#     { map: "Volskaya Industries", map_type: "assault" },
#     { map: "Watchpoint: Gibraltar", map_type: "escort" }])

# Hero.create([{ name: "Ana", role: "support" },
#     { name: "Ashe", role: "damage" },
#     { name: "Baptiste", role: "support" },
#     { name: "Bastion", role: "damage" },
#     { name: "Brigitte", role: "support" },
#     { name: "D.Va", role: "tank" },
#     { name: "Doomfist", role: "damage" },
#     { name: "Genji", role: "damage" },
#     { name: "Hanzo", role: "damage" },
#     { name: "Junkrat", role: "damage" },
#     { name: "Lucio", role: "support" },
#     { name: "Mccree", role: "damage" },
#     { name: "Mei", role: "damage" },
#     { name: "Mercy", role: "support" },
#     { name: "Moira", role: "support" },
#     { name: "Orisa", role: "tank" },
#     { name: "Pharah", role: "damage" },
#     { name: "Reaper", role: "damage" },
#     { name: "Reinhardt", role: "tank" },
#     { name: "Roadhog", role: "tank" },
#     { name: "Sigma", role: "tank" },
#     { name: "Soldier: 76", role: "damage" },
#     { name: "Sombra", role: "damage" },
#     { name: "Symmetra", role: "damage" },
#     { name: "Torbjörn", role: "damage" },
#     { name: "Tracer", role: "damage" },
#     { name: "Widowmaker", role: "support" },
#     { name: "Winston", role: "tank" },
#     { name: "Wrecking Ball", role: "tank" },
#     { name: "Zarya", role: "tank" },
#     { name: "Zenyatta", role: "support" }])


testUser = User.create({ username: "testUser", email: "test@user.com", password: "123" })
testSeason = Season.create({ season: "20", user_id: testUser.id })

475.times do 
    result = ["win", "loss"]
    sr = [2976, 3001, 3024, 3048]
    Game.create({
        result: result.sample,
        sr: sr.sample,
        season_id: testSeason.id,
        map_id: Map.all.sample.id,
        hero_id: Hero.all.sample.id
    })
end

25.times do 
    sr = [2976, 3001, 3024, 3048]
    Game.create({
        result: "draw",
        sr: sr.sample,
        season_id: testSeason.id,
        map_id: Map.all.sample.id,
        hero_id: Hero.all.sample.id
    })
end




