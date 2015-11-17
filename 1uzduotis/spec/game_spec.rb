require 'spec_helper'

describe "Game Object" do
	before :all do
		game_arr = [
			Stat.new("20", "Petras Petrauskas", "Rytas-Zalgiris"),
			Stat.new("10", "Jonas Jonaitis", "Rytas-Zalgiris"),
			Stat.new("5", "Juozas Juozaitis", "Rytas-Zalgiris")
		]
		
		File.open "stats.yml", "w" do |f|
			f.write YAML::dump game_arr
		end
	end
	
	before :each do
		@game = Game.new "stats.yml"
	end
	
	describe "#new" do
		context "with no parameters" do
			it "has no stats" do
				game = Game.new
				expect(game.stats.length).to eql(0)
			end
		end
		
		context "with a yaml file name parameter" do
			it "has 3 stats" do
				expect(@game.stats.length).to eql(3)
			end
		end
	end
	
	it "returns all stats in a game" do
		expect(@game.get_stats_in_game("Rytas-Zalgiris").length).to eql(3)
	end
	
	it "accepts new stats" do
		@game.add_stat( Stat.new("15", "Arvydas Sabonis", "Rytas-Zalgiris"))
		expect(@game.get_stats_in_game("Rytas-Zalgiris").length).to eql(4)
	end
	
	it "saves the game" do
		stats = @game.stats.map { |stat| stat.player }
		@game.save "my_game.yml"
		game2 = Game.new "my_game.yml"
		stats2 = game2.stats.map { |stat| stat.player }
		expect(stats2).to eql(stats)
	end
end