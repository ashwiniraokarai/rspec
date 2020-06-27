#change matcher checks that a method changes the state of an object in a certain way

RSpec.describe "change matcher" do

  subject { [1, 2, 3] }

  it "checks that the push method changes state of the array" do
    #on expect you mention what you want to alter (the action you want to perform such that ot affects the object state)
    #and on change you write what state it changes and how
    #When you push an element to an array (object), the length of the array increases by 1
    expect { subject.push(10) }.to change { subject.length }.by(1)
  end

  it "checks that the pop method changes state of the array" do
    #When you pop an element from an array (object), the length of the array (object) decreases by 1
    expect { subject.pop() }.to change { subject.length }.by(-1)
  end

end
