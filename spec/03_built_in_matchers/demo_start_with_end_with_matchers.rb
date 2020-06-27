RSpec.describe "start_with_matchers" do
  it "checks that an element starts with predefined content" do
    expect("hello").to start_with("hell")
    expect( [1, 2, 3] ).to start_with( 1,2 )
  end
end

RSpec.describe "end_with_matchers" do
  it "checks that an element ends with predefined content" do
    expect("hello").to end_with("lo")
    expect( [1, 2, 3] ).to end_with( 3 )
  end
end
