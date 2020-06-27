#when you create an instance_double instead of just a plain ol' double, you tighten your double in a good way.
#You can be sure you don't create dummy instance methods on it that don't exist on the real class you are mocking.
#Thus ensuring the names of instance methods defined on your double match the pool of instance methods
#on the original (real) class such that the DOUBLE resembles the REAL as closely as possible.

#real class
class Person
  #make the instance method gettable (readable)
  attr_reader :a

  #real instance method
  def a
    sleep(3)  #do some time/resource/externally dependent intensive operation
    "hello"
  end
end

RSpec.describe Person do
  describe "regular double" do
    it "can stub any method - fortunately and unfortunately" do
      #create a REGULAR DOUBLE with stub method that does not exist on the real Person class
      #here we create instance method stub 'b' to return value "goodbye".
      #allowing this is good for TDD but bad because it goes unregulated => potential for error
      person_double = double("Person", b: "goodbye")
      expect(person_double.b).to eq("goodbye")
    end
  end

  describe "instance double" do
    it "can stub only those instance methods that are defined on the real class" do
      #try creating an INSTANCE DOUBLE with a method that does not exist on the real Person class
      #the first argument HAS to be the NAME of the CLASS you want to make a DOUBLE of
      person_double = instance_double("Person")
      #again, we create a stub of imaginary instance method 'b' to return value "goodbye".
      #fails because stubbing of ONLY those instance methods that exist in the real class is allowed
      allow(person_double).to receive(:b).and_return("goodbye") #error: the Person class does not implement
                                                              #the instance method: b

      #stub the real method 'a' but try allowing args that are not defined on the real method => fail
      allow(person_double).to receive(:a).with("hi") #error: Wrong number of arguments. Expected 0, got 1.
    end
  end
end
