RSpec.describe "nested hooks" do

  #runs before every example within this describe block, even on nested examples
  before(:example) do
    puts "OUTER before example"
  end

  #runs once before this entire outer describe block
  before(:context) do
    puts "OUTER before context"
  end

  it "does basic math" do
    expect(1 + 1).to eq(2)
  end

  context "with some condition" do

    #runs before every example in this nested block
    before(:example) do
      puts "INNER before example"
    end

    #runs once before this inner block (context block)
    before(:context) do
      puts "INNER before context"
    end

    it "does subtraction" do
      expect(5 - 3).to eq(2)
    end

    it "does multiplication" do
      expect(2 * 2).to eq(4)
    end
  end
end
