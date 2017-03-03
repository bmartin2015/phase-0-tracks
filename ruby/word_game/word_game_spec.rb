require_relative "word_game"

describe WordGame do
	let(:game) { WordGame.new("sunflower")}

	it "prints out current guess word" do
		expect(game.print_word).to eq "_ _ _ _ _ _ _ _ _"
	end

	it "guess the wrong word" do
		expect(game.guess_word("bunflower")).to eq false
	end

		it "guess the correct word" do
		expect(game.guess_word("sunflower")).to eq true
	end

	it "guess the same word twice" do
		expect(game.guess_word("sunplower")).to eq false
		expect(game.guess_word("sunplower")).to eq false
	end

	it "print the words guessed" do
		expect(game.guess_word("sunplower")).to eq false
		expect(game.guess_word("shunmower")).to eq false
		expect(game.print_words_guessed).to eq "Words Guessed: sunplower, shunmower"
	end
end