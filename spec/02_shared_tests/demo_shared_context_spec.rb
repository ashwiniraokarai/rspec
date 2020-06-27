#To avoid redundant code, you can place common context in one place that you can call throughout the describe blocks.
#Realistically you will have each describe in their own spec files
#and 1 spec file for storing the shared example. Files under spec files are automatically made available globally

RSpec.shared_context "common_context" do
  before do
    @some_array = []
  end

  def some_helper_method
    5
  end

  let(:some_variable) { [1, 2, 3] }
end

RSpec.describe "demo common context" do
  include_context "common_context"

  it "can access entities in the shared context" do
    expect(@some_array.length).to eq(0)
    @some_array << 1
    expect(@some_array.length).to eq(1)
  end

  it "can also access entities in the shared context" do
    expect(@some_array.length).to eq(0)
  end
end
