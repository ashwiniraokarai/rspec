RSpec.describe "not_to_method" do
  it "checks that two values do not match" do
    expect([1,2]).not_to eq([1,2]) #not_to is the inverse of to. This step fails because actual and expected are in fact equal
  end
end
