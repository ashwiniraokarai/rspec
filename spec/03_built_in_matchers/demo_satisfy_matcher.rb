#satisfy_matcher is a powerful matcher. It allows you to write custom assertion to check to be met

RSpec.describe "satisfy matcher" do
  subject { "racecar" } #a palindrome
  #subject { "racecars" } #not a palindrome

  it "checks that the string is a palindrome" do
    expect(subject).to satisfy { |value| value == value.reverse }
    #expect(subject).to eq(subject.reverse)
  end

  it "throws a humanized message when the string isn't a palindrome" do
    expect(subject).to satisfy("be a palindrome") {|value| value == value.reverse}
  end
end
