#Write a compound expectation that asserts the string firetruck starts with the
#substring "fire" and ends with the substring "truck".

RSpec.describe "compounded expectation on strings" do
  it "checks the beginning and end of a string" do
    expect("firetruck").to start_with("fire").and end_with("truck")
  end
end


#Write a compound expectation that asserts that the number 20 is even and that
#it responds to the times method.
RSpec.describe 20 do
  it "checks that the number is even and that it responds to times method" do
    expect(subject).to be_even.and respond_to(:times)
  end
end


#Write a compound expectation that asserts that the array [4, 8, 15, 16, 23, 42]
#includes the value 42 and starts with the values 4, 8, and 15.
RSpec.describe [4, 8, 15, 16, 23, 42] do
  it "checks that the array includes 42 and starts with 4, 8, 15" do
    expect(subject).to include( 42 ).and start_with( 4, 8, 15 )
  end
end
