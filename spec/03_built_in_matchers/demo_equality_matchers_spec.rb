#eq, eql, equal, be - matchers
#be is just an alias for equal. They function exactly the same way

RSpec.describe "equality matchers" do
  let(:a) { 3.0 }
  let(:b) { 3 }

  describe "eq matcher" do
    it "compares values and ignores type" do
      expect(a).to eq(b)
   end
  end

  describe "eql matcher" do
    it "compares values and type" do
      expect(a).to eql(b) #fails because the comparison is strict. a (3.0) is a float and b (3) is an int
   end
  end

  describe "equal matcher" do
    let(:c) { [1, 2, 3] }
    let(:d) { [1, 2, 3] }
    let(:e) { c }

    it "compares object identity between c and d" do
      expect(c).to equal(d) #fails because c and d are not the same object - they have different addresses
                            #expected #<Array:70266031812020> => [1, 2, 3]
                            #got #<Array:70266031812080> => [1, 2, 3]
    end

    it "compares object identity between e and c" do
      expect(e).to equal(c) #passes because e is pointing to c's address. They are identical.
    end
  end

  describe "be matcher" do
    it "is an alias for the equal matcher - they are one and the same" do
      expect([1, 2, 3]).to be([1, 2, 3])#fails
                                        #expected #<Array:70159058627660> => [1, 2, 3]
                                        #got #<Array:70159058627700> => [1, 2, 3]
    end
  end
end
