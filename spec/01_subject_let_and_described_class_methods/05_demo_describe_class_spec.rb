class King
  attribute_reader :name

  def initialize(name)
    @name = name
  end
end


RSpec.describe King do
  #you can instantiate your class under test simply by referring to it as-
  #described_class.new("Akbar") instead of King.new("Akbar")
  #this helps keeps your code flexible. If the class name change from King your Queen
  #you won't have much to change in across your tests.
  subject { described_class.new("Boris") }

  let(:louis) { described_class.new("Lewis") }
end
