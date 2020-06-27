#falsy values in ruby: false, nil
#truthy: everything else!


#be_truthy matcher is helpful when you want to check that a method returns say an array but you don't
#really care about what the value itself, you just care that an array is returned (that the correct data type
#is returned and not something else, say like a hash or a bare variable)

RSpec.describe "truthy falsy and nil" do
  it "check for truthiness" do
    expect(1 < 2).to be_truthy
    expect([]).to be_truthy #empties are still truthies
    expect(-1).to be_truthy #negatives are still truthies
  end

  it "check for falsiness" do
    expect(1 > 2).to be_falsey
    expect(nil).to be_falsey
    my_array = [1, 2, 3]
    expect(my_array[3]).to be_falsey #ruby returns nil when you look up a non-existent array index
  end

  it "check for specifically nilness" do
    my_hash = { a: 1 }
    expect(my_hash[:b]).to be_falsey #ruby returns nil when you look up a non-existent key in hash
  end

end
