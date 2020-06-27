#this would be its own file where actual code to be tested lives (say your model class), typically in a card.rb file which
#you import into your test file (this spec file)
class Card
  #has get and set methods for the said variables written under the hood
  attr_accessor :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end
end

#-------this where actual contents of spec.rb begin-----------------------------------------------------
#assume we are to build a Card class and want to validate every card coming out of it (instance of card)
#before the class is created you write 'Card' within quotes, as a string (it can be anything but naming it after the to-be class makes sense)
#after the class is created, and tests are passing, you remove the quotes and simply write Card
#under the hood, this makes available helper methods that you'll use down the line

RSpec.describe Card do

  #technically let statements are run before each example, just like before hook but does lazy loading (runs only in those examples where the card object to avoid instantiation in examples that don't need it)
  let(:card) { Card.new("ace", "spades") }
  let(:x) { 1 } #this is just for demoing a contrived example of let method for better understanding
  let(:y) { x + 10}

  it 'has a rank and can be changed' do
    #card = Card.new "ace", "spades"  #the instance (card object is available only within this "it" block if instantiated here)
    expect(card.rank).to eq("ace") #compare against initial value coming from let (ace)
    card.rank = "king"    #mutate the value (king)
    expect(card.rank).to eq("king") #compare against the mutated value (king)

    puts x  # initial value coming from let (1)
    x = 5   #mutate the value
    puts x  #5 (mutated value)
    puts y  #11 (unmutated value of x plus 10)
  end

  it 'has a suit' do
    #card = Card.new "ace", "spades"
    expect(card.suit).to eq("spades")
    puts x  #initial value coming from let (1)
  end
end
