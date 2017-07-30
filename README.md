# 🐲  Argz

Command-line application library for Crystal.

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  argz:
    github: picatz/argz
```

## Usage

```crystal
require "argz"
```

### Example Application

```crystal
Argz::App.build do 
  name        "Example Application"
  summary     "I wanted to build an example!"
  description "Example command-line application built with Argz..."
  command "Example", required: true, default: "Yay!" do
    short "-e"
    long  "--example"
    summary     "Required option with a default."
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
```

###### Will Output

```shell
app
Version: 1.0.0
Usage: app.cr [Options]
  -e            --example   Required option with a default.         default:Yay!
  -1me --one-more-example   This option is just one more for fun.
```

#### Each Argument

Accessing each argument that has been passed to the command-line is fairly straight-forward:

```crystal
Argz::Raw.each do |argument|
  puts argument # do something with it
end
```

#### All Arguments

To get a big glob of all the possible arguments that were given:

```crystal
all = Argz::Raw.all

all.class
# => Array(String)

all.each do |argument|
  # do something with the argument
end
```

#### Flags

Command-line arguments are usually specified with flags. Flags start with a "-" when passed into the application. Where? At the command-line, naturally. However, 

`Argz::Raw.add(flag_or_flags)` Allows us to append arguments to simulate if the arguments were passed to the command-line.

`Argz::Raw.is_flag?(flag)` Will check if a given flag has been passed into the command-line.

`Argz::Raw.is_flag_like?(flag)` Will check if a given string could pass for the flag, but won't check if it actually has been passed as a command-line argument.

```crystal
# Add raw command-line arguments to ARGV
Argz::Raw.add(["-key", "value"]

# Check if a given string is a given command-line flag.
Argz::Raw.is_flag?("-key")
# => true

# This flag hasn't been added as a command-line argument.
Argz::Raw.is_flag?("-nope")
# => false

# Check if a given string is flag-like.
Argz::Raw.is_flag_like?("-nope")
# => true
```

#### Arguments

Arguments for flags exist, but sometimes they don't! How do you work with them?

`Argz::Raw.arguments_to(flag)` will return an array with arguments for that flag if they exist.

`Argz::Raw.arguments_to?(flag)` will return a boolean; true if the flag has arguments, and false if doesn't.

```crystal
Argz::Raw.add("-example", "-example2", "a", "b", "c")

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
```

## Contributors

- [picat](https://github.com/picatz) Kent Gruber - creator, maintainer
