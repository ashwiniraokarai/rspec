RSpec.describe 'before and after hooks' do

  before(:example) do
   puts "run before every example in this group"
  end

  after(:example) do
    puts "run after every example in this group"
  end

  before(:context) do
    puts "runs before each context - which in this case is the describe block"
  end

  after(:context) do
    puts "runs after each context - which in this case is the describe block "
  end
  
  it "is a random example" do
    expect(5 * 4).to eq(20)
  end

  it "is another random example" do
    expect(3 - 2).to eq(1)
  end

end
