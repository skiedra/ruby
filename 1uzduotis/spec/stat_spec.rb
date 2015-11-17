require 'spec_helper'

describe Stat do
	before :each do
		@stat = Stat.new "Points", "Player", "Game"
	end
	describe "#new" do
		it "throws an error when given fewer than 3 parameters" do
			expect{ Stat.new("Points", "Player")}.to raise_error(ArgumentError)
		end
	end
	
	describe "#new" do
		it "throws an error when given fewer than 3 parameters" do
			expect{ Stat.new("Player")}.to raise_error(ArgumentError)
		end
	end
	
	describe "#points" do
		it "returns the correct points" do
			expect("Points").to eql(@stat.points)
		end
	end
	describe "#player" do
		it "returns the correct player" do
			expect("Player").to eql(@stat.player)
		end
	end
	describe "#game" do
		it "returns the correct game" do
			expect("Game").to eql(@stat.game)
		end
	end
end