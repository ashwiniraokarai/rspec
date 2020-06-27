#the ALLOW method as seen so far is to define allowed dummy methods and return values on a double (dummy instance of
#hypothetical class). However, it CAN also be used to STUB out METHODS on REAL CLASSES

RSpec.describe "explore allow-method's capabilities" do
  it "can stub (dummy) methods and return values on a double" do
    calculator_double = double("Calculator")
    #allow stub for (create a dummy) the add method on the dummy calculator object
    allow(calculator_double).to receive(:add).and_return(15) #return a hard coded value regardless of arguments
    expect(calculator_double.add).to eq(15)
    expect(calculator_double.add(3)).to eq(15)
    expect(calculator_double.add(3, -3)).to eq(15)
    expect(calculator_double.add("hello")).to eq(15)
  end

  it "can also stub (dummy) methods on real objects (objects of real class)" do
    real_arr_object = [1, 2, 3]

    #assert on the real sum method available to any real array object
    expect(real_arr_object.sum).to eq(6)

    #stub (create a dummy for) the real sum method
    allow(real_arr_object).to receive(:sum).and_return(10) #hard code return value regardless of arguments

    #assert on the stub (dummy sum method)
    expect(real_arr_object.sum).to eq(10)
  end

  it "can also return multiple values sequentially on a stub method" do
    #create a double
    array_double = double("array")
    #allow a stub (dummy) for pop method on the dummy array object
    allow(array_double).to receive(:pop).and_return(3, 5, 7) #hard code a DIFFERENT but SPECIFIC return value to be returned on each call
    expect(array_double.pop).to eq(3) #first call returns 3
    expect(array_double.pop).to eq(5) #second call returns 5
    expect(array_double.pop).to eq(7) #third call returns 7
    expect(array_double.pop).to eq(7) #any number of subsequent calls return 7
    expect(array_double.pop).to eq(7) #any number of subsequent calls return 7
  end
end
