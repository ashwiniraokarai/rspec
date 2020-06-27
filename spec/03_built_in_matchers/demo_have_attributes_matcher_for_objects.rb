#checks object attributes
class ProfessionalWrestler
attr_reader :name, :finishing_move

  def initialize(name, finishing_move)
    @name = name
    @finishing_move = finishing_move
  end
end



RSpec.describe "have_attributes matcher" do
  describe ProfessionalWrestler do
    subject {
      described_class.new("Stone Cold Steve Austin", "Stunner")
    }

    it "checks attributes" do
      expect(subject).to have_attributes(name: "Stone Cold Steve Austin", finishing_move: "Stunner")
      expect(subject).to have_attributes(name: "Stone Cold Steve Austin")
      expect(subject).to have_attributes(finishing_move: "Stunner")
    end
  end

end
