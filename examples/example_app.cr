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
    # Flags 
    short "-e"
    # Details
    summary     "Example required option, with a default."
    description "Notice how you can use the shorter ways of doing this?"
  end
 
  # Second Example 
  command "One More Example" do
    # Flags 
    long  "--one-more"
    # Details
    summary     "This option is much simpler."
    description "Notice how it is neither required, nor has a default."
  end

end

Argz::App.run!

#Argz::App.commands do |command|
#  puts command.long?
#end


#Argz::App.run!
