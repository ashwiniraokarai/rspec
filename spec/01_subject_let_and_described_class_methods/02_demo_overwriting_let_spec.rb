
class ProgrammingLanguage
  attr_reader :name

  def initialize(name = "ruby")
    @name = name
  end
end


RSpec.describe ProgrammingLanguage do
  let(:language) { ProgrammingLanguage.new("python") }

  it "should store the provided name" do
    expect(language.name).to eq("python")
  end

 context "when no name is provided" do
   #overrides the outer instance variable
  let(:language) { ProgrammingLanguage.new() }

    it "should store the default name" do
      expect(language.name).to eq("ruby")
    end
  end
end
