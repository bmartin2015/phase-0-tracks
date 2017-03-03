require_relative "word_game"

describe WordGame do
	let(:game) { WordGame.new("sunflower")}

	it "prints out current guess word" do
		expect(game.print_word).to eq "_ _ _ _ _ _ _ _ _"
	end
end