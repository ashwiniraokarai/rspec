#not_to matcher checks for the inverse of matchers
#It checks for negative affirmation and can be paired with any of the various built_in matchers

RSpec.describe "not_to matcher" do
  it "checks for the inverse of a matcher" do
    #inverse of eq matcher
    expect(5).not_to eq("five")

    #inverse of equal matcher
    expect([1, 2, 3]).not_to equal([1, 2, 3]) #passes because equal matcher checks for equality in object identity

    #inverse of eq matcher
    #expect([1, 2, 3]).not_to eq([1, 2, 3]) #fails because eq matcher checks for equality by value

    #inverse of be_odd predicate matcher
    expect(10).not_to be_odd

    #inverse of be_empty predicate matcher
    expect([1, 2, 3]).not_to be_empty

    #inverse of be_truthy matcher
    expect(nil).not_to be_truthy

    #inverse of start_with matcher
    expect("Philadephia").not_to start_with("Philly")

    #inverse of end_with matcher
    expect("Philadelphia").not_to end_with("delphi")

    #inverse of respond_to matcher (in here a number cannot respond to length method. A string or array would)
    expect(5).not_to respond_to { :length }

    #inverse of include matcher
    expect([:a, :b, :c]).not_to include(:d)

    #inverse of raise_error matcher
    expect{ 11 / 3 }.not_to raise_error()
  end
end
