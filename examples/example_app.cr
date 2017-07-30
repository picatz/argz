require "../src/argz"

Argz::App.build do 
  name        "Example Application"
  summary     "I wanted to build an example!"
  description "Example command-line application built with Argz..."
  command "Example" do
    short "-e"
    long  "--example"
    description "Example required option, with a default."
    required
    default "yay" 
  end
  command "One More Example" do
    short "-1me"
    long  "--one-more-example"
    description "Example of a non-required option, without a default."
  end
end

Argz::App.commands do |command|
  puts command.name
  puts command.short
  puts command.required?
  puts command.default?
end
