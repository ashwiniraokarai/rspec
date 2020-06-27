#The common functionality among all the describe blocks is that if we were to write
#example to test their length via subject.length they would return a common value viz. 3 -
#To avoid redundant code, you can place that test in a common example that you can call throughout the describe blocks.
#Realistically you will have each of these describes in their own spec files
#and 1 spec file for storing the shared example.


RSpec.shared_examples "returns length of a collection" do
  it "returns the number of items in the collection" do
    expect(subject.length).to eq(3)
    #it is the responsibility of the individual describe blocks/spec files that call this shared_examples
    #to have the "subject" defined on them
  end
end

RSpec.describe Array do
  subject { [1, 2, 3]}
  #subject.length would return 3

  #calls the matching shared_examples
  include_examples "returns length of a collection"
end

RSpec.describe String do
  subject { "abc" }
  #subject.length would return 3

  #calls the matching shared_examples
  include_examples "returns length of a collection"
end

RSpec.describe Hash do
  subject { {a: 1, b: 2, c: 3} }
  #subject.length would return 3

  #calls the matching shared_examples
  include_examples "returns length of a collection"
end

class Collection
  def length
    3 #simply returns a hard coded length
  end
end

RSpec.describe Collection do
  subject { described_class.new() }
  #subject.length would return 3

  #calls the matching shared_examples
  include_examples "returns length of a collection"
end
