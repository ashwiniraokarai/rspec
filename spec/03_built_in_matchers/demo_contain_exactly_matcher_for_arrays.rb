#the contain_exactly matcher works ONLY in 2 cases:
# on arrays
# on collections that can be converted to arrays via the to_ary or to_ar methods

RSpec.describe "contain exactly matcher" do
  subject { [1, 2, 3] }

  it "checks that an array includes a predefined set of elements in any order" do
    expect(subject).to contain_exactly(1, 2, 3) #pass
    expect(subject).to contain_exactly(2, 1, 3) #pass
    expect(subject).to contain_exactly(3, 2, 1) #pass
    expect(subject).to contain_exactly(1, 3, 2) #pass
    expect(subject).to contain_exactly(3, 1, 2) #pass
    expect(subject).to contain_exactly(2, 3, 1) #pass

    expect(subject).to contain_exactly(1, 2)  #fails
                                              #expected collection contained:  [1, 2]
                                              #actual collection contained:    [1, 2, 3]
                                              #the extra elements were:        [3]
    expect(subject).to contain_exactly(1, 2, 3, 4) #fails
    expect(subject).to contain_exactly(3, 4, 5) #fails

    expect( "bharo" ).to contain_exactly( "bharo" ) #fails
                                                    #Failure/Error: expect( "bharo" ).to contain_exactly( "bharo" )
                                                    # expected a collection that can be converted to an array with `#to_ary` or `#to_a`, but got "bharo"
  end
end
