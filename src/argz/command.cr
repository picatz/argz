module Argz

  class Command < DSL

    def self.build(name : String)
      new.build do |builder|
        builder.name name
        with builder yield builder
      end
    end

    def initialize
      @name        = String
      @description = String
      @summary     = String
      @short       = String
      @long        = String
      @required    = false
      @default     = false
      @examples    = {} of String => String
    end

    def example(name : String, &block : Proc(String))
      @examples[name] = block.call
    end

    def examples
      @examples
    end
    
    def examples
      @examples.each do |name, command|
        yield name, command
      end
    end

    def to_h
      { "name": @name,
        "short": @short,
        "long": @long,
        "required": @required,
        "default": @default,
        "summary": @summary,
        "description": @description,
        "examples": @examples
      }
    end
    
    def default(str : String)
      @default = str
    end

    def default?
      return true if @default
      false
    end
    
    def default
      @default
    end
    
    def required?
      @required
    end
    
    def required
      @required = true
    end
    
    def required?
      @required
    end

    def name(str : String)
      @name = str
    end
    
    def name
      @name
    end
    
    def description(str : String)
      @description = str
    end
    
    def desc(str : String)
      @description = str
    end
    
    def description 
      @description
    end
    
    def desc
      @description
    end

    def summary(str : String)
      @summary = str
    end 
    
    def smry(str : String)
      @summary = str
    end 
    
    def summary
      @summary
    end 
    
    def short(str : String)
      @short = str
    end 
    
    def shrt(str : String)
      @short = str
    end 
    
    def short
      @short
    end 
    
    def short?
      return true if @short
      false
    end 
    
    def shrt
      @short
    end

    def long(str : String)
      @long = str
    end 
    
    def long
      @long
    end 

    def long?
      return true if @long
      false
    end

  end
end
