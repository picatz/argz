require "../src/argz"

# Delete any arguments that are unexpected
Argz::Raw.delete_all

# Add example arguments that could be passed at the command-line.
Argz::Raw.add(["-example", "-example2", "a", "b", "c"])

# No arguments given for this flag.
Argz::Raw.arguments_to?("-example")
# => false
Argz::Raw.arguments_to("-example")
# => []

# Arguments given for this flag.
Argz::Raw.arguments_to?("-example2")
# => true
Argz::Raw.arguments_to("-example2")
# => ["a", "b", "c"]
