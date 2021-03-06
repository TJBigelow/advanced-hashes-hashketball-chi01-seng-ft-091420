require "pry"
# Write your code below game_hash
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def num_points_scored(player_input)
  game_hash.each {|team, team_info|
    team_info[:players].each {|player_info|
      if player_info[:player_name] == player_input
        return player_info[:points]
      end
    }
  }
end

def shoe_size(player_input)
  game_hash.each {|team, team_info|
    team_info[:players].each {|player_info|
      if player_info[:player_name] == player_input
        return player_info[:shoe]
      end
    }
  }
end

def team_colors(team_input)
  game_hash.each {|team, team_info|
    if team_info[:team_name] == team_input
      return team_info[:colors]
    end
  }
end

def team_names
  game_hash.each_with_object([]) {|(team, team_info), name_array|
    name_array.push(team_info[:team_name])
  }
end

def player_numbers(team_input)
  game_hash.each {|team, team_info|
    if team_info[:team_name] == team_input
      return team_info[:players].each_with_object([]) {|player_info, number_array|
        number_array.push(player_info[:number])
      }
    end
  }
end

def player_stats(player_input)
  game_hash.each {|team, team_info|
    team_info[:players].each {|player_info|
      if player_info[:player_name] == player_input
        return player_info
      end
    }
  }
end

def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0
  game_hash.each {|team, team_info|
    team_info[:players].each {|player_info|
      if player_info[:shoe] > biggest_shoe
        biggest_shoe = player_info[:shoe]
        rebounds = player_info[:rebounds]
      end
    }
  }
  rebounds
end

def most_points_scored
  best_player = ''
  points_scored = 0
  game_hash.each {|team, team_info|
    team_info[:players].each {|player_info|
      if player_info[:points] > points_scored
        points_scored = player_info[:points]
        best_player = player_info[:player_name]
      end
    }
  }
  best_player
end

def winning_team
  home_score = 0
  away_score = 0
  game_hash[:home][:players].each {|player_info|
    home_score += player_info[:points]
  }
  game_hash[:away][:players].each {|player_info|
    away_score += player_info[:points]
  }
  if home_score > away_score
    return game_hash[:home][:team_name]
  elsif home_score < away_score
    return game_hash[:away][:team_name]
  else
    return nil
  end
end

def player_with_longest_name
  longest_count = 0
  longest_name = ""
  game_hash.each {|team, team_info|
    team_info[:players].each {|player_info|
      if player_info[:player_name].length > longest_count
        longest_count = player_info[:player_name].length
        longest_name = player_info[:player_name]
      end
    }
  }
  longest_name
end

def long_name_steals_a_ton
  longest_count = 0
  longest_name = ""
  most_steals = 0
  stealer_name = ""
  game_hash.each {|team, team_info|
    team_info[:players].each {|player_info|
      if player_info[:player_name].length > longest_count
        longest_count = player_info[:player_name].length
        longest_name = player_info[:player_name]
      end
      if player_info[:steals] > most_steals
        most_steals = player_info[:steals]
        stealer_name = player_info[:player_name]
      end
    }
  }
  return stealer_name == longest_name
end
