#comparison using built in ruby mathemtical operators paired with be method

RSpec.describe "comparison matchers" do
  it "allows for comparison with built in ruby operators" do
    expect(10).to be > 5
    expect(10).to be < 15
    expect(10).to be >= 10
    expect(10).to be <= 10
  end

  #alernate syntaxes
  describe 10 do
    it "is expected to be greater than 5" do
      expect(subject).to be > 5 #subject automatically points to 10
    end

    #short hand version of expect
    it { is_expected.to be > 5 }

    it "is expected NOT to be greater than 10" do
      expect(subject).not_to be > 10 #subject automatically points to 10
    end

    #short hand version of expect
    it { is_expected.not_to be > 10}
  end
end
