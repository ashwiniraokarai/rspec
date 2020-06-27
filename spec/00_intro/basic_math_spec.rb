RSpec.describe "math calculations" do
  it "does basic math" do
     expect(1 + 1).to eq(2)
     expect(3 * 4).to eq(12)
     expect(6 / 2).to eq(3)
     expect(5 - 3).to eq(2)
  end
end
