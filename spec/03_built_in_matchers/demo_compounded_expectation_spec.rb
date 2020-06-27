#compounded expectation when you want to COMBINE multiple expectations together
#using the "and" or the "or" methods

RSpec.describe "compounded expectations" do
  describe 25 do
    it "chains several matchers using the and method" do
      expect(subject).to be_odd.and(be > 20).and(be_is_a Numeric)
    end
  end

  describe "caterpillar" do
    it "supports multiple matchers on a single line" do
      expect(subject).to start_with("cater").and end_with("pillar")
    end
  end

  describe [:usa, :canada, :mexico] do
    it "also supports chaining via the or method" do
      expect(subject.sample).to eq(:usa).or eq(:canada).or eq(:mexico)
    end
  end
end
