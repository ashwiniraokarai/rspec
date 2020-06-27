#respond_to matcher: checks that an object can respond a method or a list of methods called on it.
#The matcher is less concerned about specifics of what arguments the methods takes, or what the method does, or
#what it responds with

#a class with methods
class HotChocolate
  def drink
    "Slurrrp - enjoy your drink"
  end

  def purchase(number)
    "Awesome - You just purchased #{number} more of hot chocolate!"
  end

  def discard
    "Plop - We've safely discarded your drink."
  end
end


RSpec.describe "respond_to matcher" do
  describe HotChocolate do
    it "checks that an object can respond to a call or message" do
      expect(subject).to respond_to(:drink)
      expect(subject).to respond_to(:drink, :discard) #can call multiple methods
      expect(subject).to respond_to(:purchase) #can call method disregarding the signature (arguments, if any)
    end

    it "can also check that an object can respond to a call or message with arguments" do
      expect(subject).to respond_to(:purchase).with(1).arguments
    end
  end
end
