require "../src/argz"

# Let's build an example command-line application with Argz!
Argz::App.build do 
  # Application Metadata
  name    "Example Application"
  version "1.0.0"
  
  # Application Details 
  summary     "I wanted to build an example!"
  description "Example command-line application built with Argz..."
  
  # First Example 
  command "Example", required: true, default: "yay" do
    short "-e"
    summary     "Example required option, with a default."
    description "Notice how you can use the shorter ways of doing this?"
  end
 
  # Second Example 
  command "One More Example" do
    long  "--one-more"
    summary     "This option is much simpler."
    description "Notice how it is not required and has no default argument."
    example "Basic" do
      "--one-more"
    end
    action do
      puts "Hello world!"
    end
  end

end

Argz::App.run!
