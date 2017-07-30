require "./spec_helper"

describe Argz::Raw do

  it "can enumerate over each given command line element" do
    Argz::Raw.add(["example", "example2"])
    Argz::Raw.each do |argument|
      argument.should be_a(String)
    end
    Argz::Raw.delete_all
  end

  it "can tell you the size of the raw argument elements" do
    Argz::Raw.size.should be_a(Int32)
  end

  it "can find the index of a given string" do
    Argz::Raw.add("example")
    Argz::Raw.index_of("example").should eq(0)
    Argz::Raw.delete_all
  end

  it "will return nil if it can't find the index of a given raw argument element" do
    Argz::Raw.index_of("example").should eq(nil)
  end

  it "will return the argument to a given command-line argument" do
    Argz::Raw.add(["-f", "example"])
    Argz::Raw.argument_to("-f").should eq("example")
    Argz::Raw.delete_all
  end

  it "can check if there are any command-line arguments" do
    Argz::Raw.delete_all
    Argz::Raw.add(["-f", "example"])
    Argz::Raw.any?.should eq(true)
    Argz::Raw.delete_all
    Argz::Raw.any?.should eq(false)
  end

  it "can check if a given command-line option is of an accepted flag format" do
    accepted_flag_formats = ["-f", "--f", "--flag", "---flag", "--hypen-flag"]
    accepted_flag_formats.each do |flag|
      Argz::Raw.is_flag_like?(flag).should eq(true)
    end
    Argz::Raw.delete_all
  end
  it "can check if a given command-line option is of an accepted flag format and exists" do
    accepted_flag_formats = ["-f", "--f", "--flag", "---flag", "--hypen-flag"]
    Argz::Raw.add(accepted_flag_formats)
    Argz::Raw.each do |flag|
      Argz::Raw.is_flag?(flag).should eq(true)
    end
    Argz::Raw.delete_all
  end

  it "can check if a given flag has an argument" do
    Argz::Raw.add(["-f", "example"])
    Argz::Raw.argument_to?("-f").should eq(true)
    Argz::Raw.delete_all
  end

  it "can check if a given flag has one or more comma seperated arguments" do
    arguments = ["-f", "example", ",", "example2", ",", "example3"]
    Argz::Raw.add(arguments)
    Argz::Raw.arguments_to?("-f").should eq(true)
    Argz::Raw.delete_all
  end

end
