RSpec.describe "assignment on double" do
  #declare the double object's allowed methods during double creation
  # (alternate approach to using allow method)
  it "creates a double object and declares the allowed methods alongwith their return value" do
    db = double("Database Connection", connect: true, disconnect: "Goodbye")

    expect(db.connect).to eq(true)
    expect(db.disconnect).to eq("Goodbye")
  end

  #declare the double object's allowed methods using the allow-method"
  it "it uses the allow method to declare allowed methods" do
    fs = double("File System")
    allow(fs).to receive(:read).and_return("Romeo and Juliet")
    allow(fs).to receive(:write).and_return(false)

    expect(fs.read).to eq("Romeo and Juliet")
    expect(fs.write).to eq(false)
  end
end
