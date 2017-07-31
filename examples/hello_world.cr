require "../src/argz"

Argz::App.build do 
  name "Hello World"
  version "1.0.0"
  
  command "Example" do
    long    "--hello-world"
    summary "Basic hello world command-line option."
    action do
      puts "Hello World!"
    end
  end
end

#Argz::Raw.add("--hello-world")

Argz::App.run!

