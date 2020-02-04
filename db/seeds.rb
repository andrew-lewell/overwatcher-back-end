# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Map.create([{ map: "Blizzard World", map_type: "hybrid" }, #1
    { map: "Busan", map_type: "control" }, #2 
    { map: "Dorado", map_type: "escort" }, #3
    { map: "Eichenwalde", map_type: "hybrid" }, #4
    { map: "Hanamura", map_type: "assault" }, #5
    { map: "Havana", map_type: "escort" }, #6
    { map: "Hollywood", map_type: "hybrid" }, #7
    { map: "Horizon Lunar Colony", map_type: "assault" }, #8
    { map: "Ilios", map_type: "control" }, #9
    { map: "Junkertown", map_type: "escort" }, #10
    { map: "King's Row", map_type: "hybrid" }, #11
    { map: "Lijiang Tower", map_type: "control" }, #12
    { map: "Nepal", map_type: "control" }, #13
    { map: "Numbani", map_type: "hybrid" }, #14
    { map: "Oasis", map_type: "control" }, #15
    { map: "Paris", map_type: "assault" }, #16
    { map: "Rialto", map_type: "escort" }, #17
    { map: "Route 66", map_type: "escort" }, #18
    { map: "Temple of Anubis", map_type: "assault" }, #19
    { map: "Volskaya Industries", map_type: "assault" }, #20
    { map: "Watchpoint: Gibraltar", map_type: "escort" }]) #21

Hero.create([{ name: "Ana", role: "support" }, #1
    { name: "Ashe", role: "damage" }, #2
    { name: "Baptiste", role: "support" }, #3
    { name: "Bastion", role: "damage" }, #4
    { name: "Brigitte", role: "support" }, #5
    { name: "D.Va", role: "tank" }, #6
    { name: "Doomfist", role: "damage" }, #7
    { name: "Genji", role: "damage" }, #8
    { name: "Hanzo", role: "damage" }, #9
    { name: "Junkrat", role: "damage" }, #10 
    { name: "Lucio", role: "support" }, #11
    { name: "Mccree", role: "damage" }, #12
    { name: "Mei", role: "damage" }, #13
    { name: "Mercy", role: "support" }, #14
    { name: "Moira", role: "support" }, #15
    { name: "Orisa", role: "tank" }, #16
    { name: "Pharah", role: "damage" }, #17
    { name: "Reaper", role: "damage" }, #18
    { name: "Reinhardt", role: "tank" }, #19
    { name: "Roadhog", role: "tank" }, #20
    { name: "Sigma", role: "tank" }, #21
    { name: "Soldier: 76", role: "damage" }, #22
    { name: "Sombra", role: "damage" }, #23
    { name: "Symmetra", role: "damage" }, #24
    { name: "Torbjörn", role: "damage" }, #25
    { name: "Tracer", role: "damage" }, #26
    { name: "Widowmaker", role: "support" }, #27
    { name: "Winston", role: "tank" }, #28
    { name: "Wrecking Ball", role: "tank" }, #29
    { name: "Zarya", role: "tank" }, #30
    { name: "Zenyatta", role: "support" }]) #31


testUser = User.create({ username: "testUser", email: "test@user.com", password: "123" })
testSeason = Season.create({ season: "20", user_id: testUser.id })

470.times do 
    result = ["win", "loss"]
    sr = [2976, 3001, 3024, 3048]
    m = [2, 3, 4, 5, 9, 11, 14, 15, 17, 19, 20]
    Game.create({
        result: result.sample,
        sr: sr.sample,
        season_id: testSeason.id,
        map_id: m.sample,
        hero_id: Hero.all.sample.id
    })
end

30.times do 
    sr = [2976, 3001, 3024, 3048]
    m = [2, 3, 4, 5, 9, 11, 14, 15, 17, 19, 20]
    Game.create({
        result: "draw",
        sr: sr.sample,
        season_id: testSeason.id,
        map_id: m.sample,
        hero_id: Hero.all.sample.id
    })
end

# 5.times do 
#     result = ["win", "loss"]
#     sr = [2976, 3001, 3024, 3048]
#     m = [2, 3, 4, 5, 9, 11, 14, 15, 17, 19, 20]
#     Game.create({
#         result: result.sample,
#         sr: sr.sample,
#         season_id: testSeason.id,
#         map_id: m.sample,
#         hero_id: Hero.all.sample.id
#     })
# end

# 1.times do 
#     sr = [2976, 3001, 3024, 3048]
#     m = [2, 3, 4, 5, 9, 11, 14, 15, 17, 19, 20]
#     Game.create({
#         result: "draw",
#         sr: sr.sample,
#         season_id: testSeason.id,
#         map_id: m.sample,
#         hero_id: Hero.all.sample.id
#     })
# end

# 15.times do 
#     result = ["win", "loss"]
#     sr = [2976, 3001, 3024, 3048]
#     m = [2, 3, 4, 5, 9, 11, 14, 15, 17, 19, 20]
#     Game.create({
#         result: result.sample,
#         sr: sr.sample,
#         season_id: testSeason.id,
#         map_id: m.sample,
#         hero_id: Hero.all.sample.id
#     })
# end







