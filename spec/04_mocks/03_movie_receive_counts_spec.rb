#class Movie interacts with class Actor (because movie has an actor, get it?)
#by taking in an instantiated actor and invoking actor methods on it
#the movie object is dependent on the actor object to be available and it's methods to be defined
#with these two objects deeply coupled, how would you test them in isolation?
#clue: replace the real object with double in you test!



#**************Code we want to test (scroll further below for specs)******************************************
#The methods of Actor class here look simple but assume them being complex + resource and time intensive involving messaging several other
#objects via APIs/ databases, etc.
class Actor
  def initialize(name)
    @name = name
  end

  def ready?
    sleep(3) #take a deep breath before saying yes, I am ready
    true
  end

  def act
    "I love you, baby!"
  end

  def fall_off_cliff
    "Call my agent. No way!"
  end

  def light_on_fire
    false
  end
end

class Movie
  def initialize(actor)
    @actor = actor
  end

  def start_shooting
    if @actor.ready?
      puts @actor.act
      puts @actor.fall_off_cliff
      puts @actor.light_on_fire
      puts @actor.act
    end
  end
end

=begin
#this is just to demonstate classes can be invoked
actor = Actor.new("MLTR")
movie = Movie.new(actor)
movie.start_shooting
=end

#**************Specs******************************************
#To test the method of Movie class - start_shooting (which interacts with Actor class), you can avoid interaction with the complex (hypothetically)
#Actor class. Simply use a double for Actor instead, and ditch all the business logic.
#Remember you are testing Movie class, not the Actor class itself

RSpec.describe Movie do
  let(:actor_double) { double("Dupe for Actor Class", ready?: true, act: "I can do real stunts", fall_off_cliff: "sure",
                                                                                        light_on_fire: "okay!") }
  subject { described_class.new(actor_double) }   #@actor instance variable in Movie class gets assigned to actor_double
  it "checks that the start_shooting method does 4 things by x times by calling the mock Actor" do
    #write out assertions for each thing the start_shooting method would do
    expect(actor_double).to receive(:ready?).once  #check that mock Actor (actor_double) received the call ONCE
    expect(actor_double).to receive(:act).twice   #can also do .at_least.twice
    expect(actor_double).to receive(:fall_off_cliff).exactly(1).times
    expect(actor_double).to receive(:light_on_fire).at_most(1).times
    subject.start_shooting #this is counterintuitive. Normally, you would invoke first but in here we do the opposite - write
                           #expecations first and invoke at the end
  end
end
