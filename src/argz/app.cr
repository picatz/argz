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
    
    def self.command(name : String)
      @@commands << Argz::Command.build do |builder|
        builder.name name
        with builder yield self
      end
    end

    def self.commands
      @@commands.each do |command|
        yield command
      end
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
    method bin, "app.cr"
    method summary, "This is a command-line application!"
    method description, "This is the default description for Argz command-line applications!"
  end
  
end
