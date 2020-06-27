RSpec.describe Array do

  context "when you add an array element" do
    it "increments the array length to 1" do
      #subject is a built in helper method that implicitly
      #instantiates an object of the class under test and refers to it      s
      expect(subject.length).to eq(0)
      subject.push("new element")
      expect(subject.length).to eq(1)
    end
  end

end
