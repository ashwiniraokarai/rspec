#check whether an element includes something else. Think of it as a hypothetical "contain" matcher:
#a broader, less strict version of contain_exactly matcher meant for arrays
#include matcher is versatile and can be used on a variety of elements - strings, arrays, hashes...you name it!

RSpec.describe "include_matcher" do
  it "checks for substring or incontiguous chars inclusion in a string" do
    expect("hello").to include("el")  #substring - consecutive chars
    expect("hello").to include("e", "o")  #individual chars, not consecutive
    #expect("hello").to include("e", "o", "m") #fail
                                            #Failure/Error: expect("hello").to include("e", "o", "m")
                                            #expected "hello" to include "m"
  end

  it "checks for any number of elements inclusion in an array" do
    expect([1, 2, 3]).to include(2, 1) #any order
  end

  it "checks for any number of keys or key-value inclusion in a hash" do
    expect({a: 1, b: 2}).to include(:a) #single key
    expect({a: 1, b: 2}).to include(:b, :a) #multiple keys - in any order
    expect({a: 1, b: 2}).to include(a: 1) #key-value pair
  end
end
