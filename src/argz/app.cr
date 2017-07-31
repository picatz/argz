module Argz

  module App

    def self.build
      with self yield self
      return self
    end

    @@commands = [] of Argz::Command


    def self.command
      @@commands << Argz::Command.build do |builder|
        with builder yield self
      end
    end

    def self.command(name : String, required = false, default = "")
      @@commands << Argz::Command.build do |builder|
        builder.name name
        builder.required if required
        builder.default default unless default == ""
        with builder yield self
      end
    end

    def self.commands
      @@commands.each do |command|
        yield command
      end
    end

    def self.commands
      @@commands
    end

    macro method(name, default)
      @@{{name}} = {{default}}

      def self.{{name}}(str : String)
        @@{{name}} = str 
      end

      def self.{{name}}=(str : String)
        @@{{name}} = str 
      end

      def self.{{name}}
        @@{{name}}
      end
    end

    method name, "app"
    method version, "1.0.0"
    method bin, "app.cr"
    method summary, "This is a command-line application!"
    method description, "This is the default description for Argz command-line applications!"

    def self.smry(str : String)
      @@summary = str
    end

    def self.desc(str : String)
      @@description = str
    end

    #@@help_menu = "#{@@name}\nVersion: #{@@version}\nUsage: #{@@bin} [Options]"

    def self.show_options
      puts self.name
      puts "Version: #{self.version}"
      puts "Usage: #{self.bin} [Options]"
      #puts @@help_menu
      max_short   = 0
      max_long    = 0
      max_summary = 0
      @@commands.each do |command|
        if command.short.class == String
          short = command.short.to_s.size
          max_short = short if short > max_short
        else
          command.short ""
        end
        if command.long.class == String
          long = command.long.to_s.size
          max_long = long if long > max_long
        else
          command.long ""
        end
        if command.summary.class == String
          summary = command.summary.to_s.size
          max_summary = summary if summary > max_summary
        else
          command.summary ""
        end
      end
      @@commands.each do |command|
        if command.default.class == String
          puts "#{command.short.to_s.rjust(max_short)} #{command.long.to_s.rjust(max_long)} \t#{command.summary.to_s.ljust(max_summary)} default:#{command.default}"
        else
          puts "#{command.short.to_s.rjust(max_short)} #{command.long.to_s.rjust(max_long)} \t#{command.summary.to_s.ljust(max_summary)}"
        end
      end
    end

    def self.run!
      unless self.commands.map(&.short).includes?("----h")
        @@commands << Argz::Command.build do |builder|
          builder.name    "Help Menu"
          builder.short   "-h"
          builder.long    "--help"
          builder.summary "Print out this help menu."
          builder.action do
            show_options
          end
        end
      else
        @@commands << Argz::Command.build do |builder|
          builder.name    "Help Menu"
          builder.long    "--help"
          builder.summary "Print out this help menu."
          builder.action do
            show_options
          end
        end
      end
      if Argz::Raw.empty?
        show_options
        exit 0
      else
      end
      Argz::App.commands do |command|
        next unless command.used?
        while command.actions?
          command.run!
        end
      end
      exit 0
    end

  end
end
