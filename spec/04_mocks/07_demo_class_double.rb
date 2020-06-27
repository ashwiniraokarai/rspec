#when you create an class_double instead of just a plain ol' double, you tighten your double in a good way
#you can be sure you don't create dummy class methods on it that don't exist on the real class you are mocking.
#Thus ensuring the names of class methods defined on your double match the pool of class methods
#on the original (real) class such that the DOUBLE resembles the REAL as closely as possible.

class Deck
  def self.build
  #business logic to build a whole bunch of cards
  end
end

class CardGame
  attr_reader :cards

  def start
    @cards = Deck.build #build is a class method
  end
end


RSpec.describe CardGame do
  it "can only stub class methods actually implemented on the real class" do
    deck_klass = class_double("Deck").as_stubbed_const
    allow(deck_klass).to receive(:build).and_return(["Ace", "Queen"]) #pass
    subject.start
    expect(subject.cards).to eq(["Ace", "Queen"])
  end

  it "cannot stub class methods not implemented on the real class" do
    deck_klass = class_double("Deck").as_stubbed_const
    allow(deck_klass).to receive(:shuffle)  #fail. Error:the Deck class does not implement the class method: shuffle
  end
end
