#let's write specs for ruby's built-in even? method. Tip: ? methods are called predicate methods
RSpec.describe "#even? method" do
  #it "returns true when the number is even" do
  #end

  #it "returns true when the number is false" do
  #end

  #when it comes to conditionals, use NESTED DESCRIBE blocks or CONTEXT method (an alias for describe method),
  #for improved code organization, code readability and output readability

  describe "with even number" do
    #even? method with even number
    it "should return true" do
      expect(4.even?).to eq(true)
    end
  end

  #context is an alias for describe, so you can use describe instead 
  context "with odd number" do
    #even? method with odd number
    it "should return false" do
      expect(3.even?).to eq(false)
    end
  end

end
