# raise_error_matcher: when you want to check that errors occur in an expected mannner
# surrounding the trigger (the expect arg) in your assertion in curly braces/ block tells rspec
# a special message - that it's an expected error. NOT doing this makes ruby trigger the error normally
# and CRASHES the rspec suite as per the regular rules of rubu.


def some_method
  x #raises a NameError due to undefined variable
end

class CustomError < StandardError; end

RSpec.describe "raise_error matcher" do
  it "can check for a specific error being raised" do
    expect { some_method }.to raise_error(NameError)
    expect { 10 / 0 }.to raise_error(ZeroDivisionError)
    #you can GOOGLE RUBY ERRORS to find the list of errors and what triggers them. Ta Da!
  end

  it "can also check for custom errors" do
    expect { raise CustomError }.to raise_error(CustomError)
  end
end
