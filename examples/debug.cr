require "../src/argz"

#ARGV << "-f"
#ARGV << "--flag"
#
#Argz::Raw
#
#puts Argz::Raw.all
#
#Argz::Raw.each do |flag|
#  puts Argz::Raw.is_flag?(flag)
#end


#puts Argz::Raw.any?

#Argz::Raw.add(["-x", "yeah"])
#puts Argz::Raw.argument_to?("-x")
#
#
#Argz::Raw.delete_all
#
#puts Argz::Raw.argument_to?("-x")


#Argz::Raw.add(["-x", "yeah", "boy", "-f", "y", "z"])
#
#puts Argz::Raw.arguments_to("-x")
#puts Argz::Raw.arguments_to("-z")
#puts Argz::Raw.arguments_to?("-z")
#puts Argz::Raw.arguments_to?("-x")
#puts Argz::Raw.arguments_to?("-f")
#puts Argz::Raw.arguments_to("-f")

Argz::App.name = "Example"
Argz::App.bin = "app"

puts Argz::App.name

puts Argz::Format.command("-f lol what")
#cmd = Argz::Command.build do
#  name  "example"
#  arg   String
#  short "-e"
#  description "example command"
#  example "Basic Usage" do
#    command Argz::Format.command("#{@short} file.txt")
#  end
#end
#
#puts cmd.name
#puts cmd.description
#
#puts cmd.to_h
#puts cmd.to_json
#
#cmd2 = Argz::Command.build do
#  name "example2"
#  description "example command number 2"
#end
#
#puts cmd2.name
#puts cmd.description
#
#puts cmd2.to_h
#puts cmd.to_h
