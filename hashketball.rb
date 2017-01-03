def game_hash
hash={home:{team_name:"Brooklyn Nets",colors:["Black", "White"],players:{
  "Alan Anderson":
{number:0,
shoe:16,
points:22,
rebounds:12,
assists:12,
steals:3,
blocks:1,
slam_dunks:1},
"Reggie Evans":
{
  number:30,
  shoe:14,
  points:12,
  rebounds:12,
  assists:12,
  steals:12,
  blocks:12,
  slam_dunks:7
},
"Brook Lopez":
{
number:11,
shoe:17,
points:17,
rebounds:19,
assists:10,
steals:3,
blocks:1,
slam_dunks:15
},
"Mason Plumlee":
{
number:1,
shoe:19,
points:26,
rebounds:12,
assists:6,
steals:3,
blocks:8,
slam_dunks:5
},
"Jason Terry":
{
number:31,
shoe:15,
points:19,
rebounds:2,
assists:2,
steals:4,
blocks:11,
slam_dunks:1
}
}
},


away:{team_name:"Charlotte Hornets",colors:["Turquoise", "Purple"],players:{
"Jeff Adrien":
{number:4,
shoe:18,
points:10,
rebounds:1,
assists:1,
steals:2,
blocks:7,
slam_dunks:2},
"Bismak Biyombo":
{
number:0,
shoe:16,
points:12,
rebounds:4,
assists:7,
steals:7,
blocks:15,
slam_dunks:10
},
"DeSagna Diop":
{
number:2,
shoe:14,
points:24,
rebounds:12,
assists:12,
steals:4,
blocks:5,
slam_dunks:5
},
"Ben Gordon":
{
number:8,
shoe:15,
points:33,
rebounds:3,
assists:2,
steals:1,
blocks:1,
slam_dunks:0
},
"Brendan Haywood":
{
number:33,
shoe:15,
points:6,
rebounds:12,
assists:12,
steals:22,
blocks:5,
slam_dunks:12
}
}
}
}
end

def num_points_scored(player_name)
  game_hash.select do |location,team_data|
    team_data.select do |data_item,datum|
      if data_item==:players
        datum.select do |name, attribute|
          if name.to_s == player_name
            attribute.select do |thing,number|
              if thing==:points
                return number
              end
            end
          end
        end
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.select do |location,team_data|
    team_data.select do |data_item,datum|
      if data_item==:players
        datum.select do |name, attribute|
          if name.to_s == player_name
            attribute.select do |thing,number|
              if thing==:shoe
                return number
              end
            end
          end
        end
      end
    end
  end
end

def team_colors(team)
  game_hash.select do |location,team_data|
    team_data.select do |data_item,datum|
      if datum.to_s==team
        team_data.select do |data_item,datum|
          if data_item==:colors
            return datum
          end
        end
      end
    end
  end
end

def team_names
  bothteams=[]
  game_hash.select do |location, team_data|
      team_data.select do |data_item, datum|
        if data_item==:team_name
          bothteams<<datum
        end
      end
    end
bothteams
end

def player_numbers(team)
  jersey_numbers = []
  game_hash.select do |location, team_data|
    team_data.select do |data_item, datum|
      if datum==team
        game_hash[location][:players].each do |name,attribute|
          attribute.each do |thing, number|
          if thing==:number
            jersey_numbers << number
          end
        end
      end
    end
  end
end
jersey_numbers
end

def player_stats(player)
  game_hash.select do |location, team_data|
    team_data.select do |data_item, datum|
      if data_item == :players
        game_hash[location][:players].select do |name,attribute|
          if name.to_s == player
            return attribute
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
  size=0
  game_hash.select do |location, team_data|
    team_data.select do |data_item,datum|
      if data_item==:players
        datum.each do |name, attribute|
          attribute.select do |thing,number|
          if thing == :shoe
            if number>size
              return game_hash[location][:players][name][:rebounds]
              end
            end
          end
        end
      end
    end
  end
end

def most_points_scored
  top_score=0
  winner=""
  game_hash.select do |location, team_data|
    team_data.select do |data_item,datum|
      if data_item==:players
        datum.select do |name, attribute|
          attribute.select do |thing,number|
            if thing == :points
              if number>top_score
                top_score=number
                winner=name.to_s
              end
            end
         end
       end
      end
    end
  end
  winner
end

def winning_team
home_score=0
away_score=0
game_hash.select do |location, team_data|
  team_data.select do |data_item,datum|
    if data_item==:players
      datum.select do |name, attribute|
        attribute.select do |thing,number|
          if thing == :points
            if location==:home
              home_score+=number
            else
              away_score+=number
            end
          end
        end
      end
    end
  end
end
puts "home= #{home_score}, away=#{away_score}"
if home_score>away_score
  team_names[0]
  else
    team_names[1]
end
end

def player_with_longest_name
  long_name=""
  game_hash.select do |location, team_data|
    team_data.select do |data_item, datum|
        game_hash[location][:players].each do |name,attribute|
          if name.length>long_name.length
            long_name=name
          end
        end
      end
    end
long_name
end

def long_name_steals_a_ton?
mr_long_name=player_with_longest_name
max_steals=0
mr_thief=""
game_hash.select do |location, team_data|
  team_data.select do |data_item,datum|
    if data_item==:players
      datum.select do |name, attribute|
        attribute.select do |thing,number|
          if thing == :steals
            if number>max_steals
              max_steals=number
              mr_thief=name.to_s
            end
          end
       end
     end
    end
  end
end
mr_long_name.to_s==mr_thief
end
