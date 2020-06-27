#customize various return values based on arguments passed to the stub method

RSpec.describe "return values based on arguments" do
  it "can return different values on the same stub method depending on the argument" do
    three_element_array  = double #assume 3 element arrays
    #let's mock the functionality of .first method usually available to real array objects

    #when .first method is called with no args
    allow(three_element_array).to receive(:first).with(no_args).and_return(3) #return 1
    expect(three_element_array.first).to eq(3)

    #when .first method is called with an argument value = 1
    allow(three_element_array).to receive(:first).with(1).and_return([3]) #return array with an element (hypothetically the first element)
    expect(three_element_array.first(1)).to eq([3])

    #when .first method is called with an argument value = 2
    allow(three_element_array).to receive(:first).with(2).and_return([3, 5]) #return array with 2 elements (hypothetically top 2 elements)
    expect(three_element_array.first(2)).to eq([3, 5])

    #when .first method is called with an argument value >= 3
    allow(three_element_array).to receive(:first).with(be >= 3).and_return([3, 5, 7]) #return array with 3 elements (hypothetically top 3 elements)
    expect(three_element_array.first(3)).to eq([3, 5, 7]) #call with arg 3
    expect(three_element_array.first(1000)).to eq([3, 5, 7]) #call with arg value 1000
  end
end
