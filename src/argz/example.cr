module Argz

  class Example < DSL 

    def initialize
      @title   = String
      @command = String
    end
    
    macro shortcut(name, short)
      def {{short}}(str : String)
        {{name}}(str)
      end
      
      def self.{{short}}
        {{name}}
      end
    end

    macro method(name, variable)
      def {{name}}(str : String)
        {{variable}} = str
      end
      
      def self.{{name}}
        {{variable}}
      end
    end

    # Add a title for your example.
    method title, @title
    
    # The actual command example.
    method command, @command

  end
end
