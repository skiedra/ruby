require 'yaml'

class Game
	attr_accessor :stats
	
	def initialize game_file = false
		@game_file = game_file
		@stats = @game_file ? YAML::load(File.read(@game_file)) : []
	end
	
	def get_stats_in_game game
		@stats.select do |stat|
			stat.game == game
		end
	end
	
	def add_stat stat
        @stats.push stat
    end
 
    def get_stat player
        @stats.select do |stat|
            stat.player == player
        end.first
    end
 
    def save game_file = false
        @game_file = game_file || @game_file || "game.yml"
        File.open @game_file, "w" do |f|
            f.write YAML::dump @stats
        end
    end
end