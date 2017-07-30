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


Argz::Raw.add(["-x", "yeah", "boy", "-f", "y", "z"])

puts Argz::Raw.arguments_to("-x")
puts Argz::Raw.arguments_to("-z")
puts Argz::Raw.arguments_to?("-z")
puts Argz::Raw.arguments_to?("-x")
puts Argz::Raw.arguments_to?("-f")
puts Argz::Raw.arguments_to("-f")
