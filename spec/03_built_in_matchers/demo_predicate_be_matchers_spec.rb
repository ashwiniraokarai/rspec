# a predicate method in a ruby is one that returns a TRUE or FALSE (those methods ending with ?)
# rspec provides matchers that complement the predicate methods
# typically the matchers are same are the method names prefixed with "be_" and the question mark stripped off

RSpec.describe "predicate methods vs perdicate matchers" do
  it "can be tested with predicate methods" do
    expect((12 / 2).even?).to eq(true)
    expect((12 / 4).odd?).to eq(true)
    expect((0 / 12).zero?).to eq(true)
  end

  it "can be tested with the more elegant predicate matchers" do
    expect(12 / 2).to be_even
    expect(12 / 4).to be_odd
    expect(0 / 12).to be_zero
    expect(12).to be_is_a Numeric
  end
end
