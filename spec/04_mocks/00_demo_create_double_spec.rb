#test double is just an object that can respond to any variety of methods we define on it
#they are typically used to stand in for real objects (think of them as stunt doubles)
#think of a double as as a dummy object/instance of a hypothetical class

RSpec.describe "a double" do
  it "it only allows defined methods to be invoked" do
    stunt_double = double("mr double") #creating a test double (object) with an identifier via the double method
                                       #and assigning it to a variable
    #stunt_double.fall_off_cliff #invoking an undefined method on the double object results in error:
                                #<Double "mr double"> received unexpected message :fall_off_cliff with (no args)
                                #you'll need to explicitly ALLOW the method to be invoked on/ received by the object
    allow(stunt_double).to receive(:fall_off_cliff)  #returns nil by default
    stunt_double.fall_off_cliff #passes but you want to do something more rspecy with it
    expect(stunt_double.fall_off_cliff).to eq(nil)

    #lets define another method but also define the return value this time
    allow(stunt_double).to receive(:light_on_fire).and_return("ouch")
    expect(stunt_double.light_on_fire).to eq("ouch")

  end

end
