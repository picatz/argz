module Argz

  module App

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
