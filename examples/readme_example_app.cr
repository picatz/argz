require "../src/argz"

Argz::App.build do 
  name        "Example Application"
  summary     "I wanted to build an example!"
  description "Example command-line application built with Argz..."
  command "Example", required: true, default: "Yay!" do
    short "-e"
    long  "--example"
    summary     "Required option with default."
    description "Sometimes options needed to be both required and have a default."
  end
  command "One More Example" do
    short "-1me"
    long  "--one-more-example"
    summary     "This option is just one more for fun."
    description "Example of a non-required option, without a default."
  end
end

Argz::App.run!
