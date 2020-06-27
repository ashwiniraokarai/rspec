RSpec.describe Array do
  subject(:my_array) {
    [1, 2]
  }

  it "is equal to [1, 2]" do
    expect(subject).to eq([1, 2])
  end
end

RSpec.describe String do
 subject(:my_string) {
     "i am a string"
 }

 it "has a length of 13" do
   expect(subject.length).to eq(13)
 end
end
