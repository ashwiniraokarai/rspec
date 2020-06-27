#all matcher is a  good substitute for .each based looping you would otherwise have to use when asserting on
#arrays and collections in general
#all matcher performs assertions or aggregate checks on ALL ELEMENTS in a collection

RSpec.describe "without all matcher" do
  it "needs a loop to run assertion on every element in the collection" do
    [1, 2, "a"].each do |i|           #loop thro the collection
      expect(i).to be_is_a Numeric  #asset using predicate matcher for is_a? Numberic
    end
  end

#the alternative using all matcher that doesn't need you to loop
 describe "all matcher" do
  it "provides a mechanism for aggregated checks on a collection" do
    expect([1, 2, "a"]).to all(be_is_a Numeric) #still using the same predicate matcher at the core
                                              #but you can ditch the loop and use the outer "all" matcher instead
  end
 end
end
