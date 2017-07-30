require "./spec_helper"

describe Argz::App do

  it "has a default name" do
    Argz::App.name.should be_a(String)
    Argz::App.name.should eq("app")
  end
  
  it "has a default executable name for formatted commands" do
    Argz::App.bin.should be_a(String)
    Argz::App.bin.should eq("app.cr")
    Argz::Format.command("-e example").split.first.should eq(Argz::App.bin)
  end
  
  it "has a default description" do
    Argz::App.description.should be_a(String)
  end
  
  it "has a default summary" do
    Argz::App.summary.should be_a(String)
  end

end
