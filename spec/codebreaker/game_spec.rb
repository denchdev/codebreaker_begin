require 'spec_helper'

module Codebreaker
	describe Game do
		context "#start" do 
			let(:game) {Game.new}
			let(:secret_code) {game.instance_variable_get(:@secret_code)}

			before do
				game.start
			end

			it "generates secret code" do
				expect(secret_code).not_to be_empty
			end

			it "saves 4 number secret code" do
				expect(secret_code).to have(4).items
			end

			it "save secret code with nurbers from 1 to 6" do
				expect(secret_code).to match(/[1-6]+/)
			end

		end

		context "#game" do
			it ""

			it ""

		end

		context "#_check" do
			let(:game) {Game.new}
			let(:secret_code) {game.instance_variable_get(:@secret_code)}

			before do
				game.start
				game.instance_variable_set(:@secret_code, "1233")
			end

			it "checks result size at most 4" do
				expect(game._check("1323")).to have_at_most(4).items
			end

			it "result is a combination of + and -" do
				expect(game._check("1534")).to match(/[\+\-]+/)
			end

			it "check the answer with the full concurrence" do
				expect(game._check("1233")).to match(/\+\+\+\+/)
			end

			it "check the response at mismatch" do
				expect(game._check("5678")).to eq("")
			end

			it "check the answer with the matching single-digit response with several figures secret code" do
				expect(game._check("1111")).to match(/\+\-\-\-/)
			end

			it "check the answer at the coincidence several numbers of response with one digit secret code" do
				expect(game._check("3555")).to match(/\-/)
			end

		end

		context "#hint" do
			let(:game) {Game.new}
			let(:secret_code) {game.instance_variable_get(:@secret_code)}

			before do
				game.start
				game.instance_variable_set(:@secret_code, "1233")
			end

			it "show random number of secret code" do
				expect(game.hint(0)).to eq("1")
			end
		end

	end
end



