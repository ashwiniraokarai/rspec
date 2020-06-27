#this would be its own file where actual code to be tested lives (say your model class), typically in a card.rb file which
#you import into your test file (this spec file)
class Card
  attr_reader :rank, :suit

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

  #will be run before each example
  before do
    #puts "Hey, i'll be output before each example"
    @card = Card.new "ace", "spades" #beware if you rename the instance variable and forget to rename in your example, ruby will throw the generic
                                     #"undefined method for nil:NilClass". To avoid this, replace the before hook with a helper method def card
                                     #and call the method in your examples. This way, if you rename your method but forget to rename in your examples,
                                     #you'll not only get an informative error but also the beloved "did you mean..?" suggestion. Wins!
  end

  it 'has a rank' do
    #card = Card.new "ace", "spades"  #the instance (card object is available only within this "it" block if instantiated here)
    expect(@card.rank).to eq("ace")
  end

  it 'has a suit' do
    #card = Card.new "ace", "spades"
    expect(@card.suit).to eq("spades")
  end
end
