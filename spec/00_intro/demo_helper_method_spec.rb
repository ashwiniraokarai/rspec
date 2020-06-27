
#code being tested
class School
  attr_reader :name, :students

  def initialize(name)
    @name = name
    @students = []
  end
end



#---spec----
RSpec.describe School do

  #helper method def school
  #you can achieve this via a before hook instead if you'd like but helper method is preferred
  #because unlike before hooks you won't have to worry in the event that you rename instance variables in your before hook for any reason
  #about your tests breaking and giving you no clear errors (the infamous "undefined method for nil:NilClass").
  #When you use methods instead, any changes to method names that you forget to change in calls within your tests, you'll
  #see a clear error and ruby suggestions for fixing (the famous and godsend "did you mean..?")

  def school
    @school = School.new('Beverly Hills High School')
  end

  it 'has a name' do
    #school = School.new('Beverly Hills High School')
    expect(school.name).to eq('Beverly Hills High School')
  end

  it 'should start off with no students' do
    #school = School.new('Notre Dame High School')
    expect(school.students).to eq([])
  end
end
