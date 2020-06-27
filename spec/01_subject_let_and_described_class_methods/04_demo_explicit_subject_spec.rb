RSpec.describe Array do
  #subject is a built in helper method that refers to an
  #instantiation of the class under test. It can be referred to directly without
  #an explicit instantiation assignment. Here, we choose the explicit instantiation
  #because we want to give the object an alias "sally" and pass some args as well
  subject(:sally) do
    [1, 2]
  end

  context "when an element is popped" do
    it "has a length of 1" do
      expect(sally.length).to eq(2)
      sally.pop()
      expect(sally.length).to eq(1)
    end
  end


  it "is equal to the original array" do
    expect(sally).to eq(subject)
    expect(sally.length).to eq(2)
  end

end
