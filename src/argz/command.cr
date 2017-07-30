module Argz

  class Command < DSL

    def initialize
      @name        = String
      @description = String
      @summary     = String
      @short       = String
      @long        = String
      @examples    = [] of String
    end
    
    def to_h
      { "name": @name,
        "short": @short,
        "long": @long,
        "summary": @summary,
        "description": @description,
        "examples": @examples
      }
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
    
    def description 
      @description
    end

    def summary(str : String)
      @summary = str
    end 
    
    def summary
      @summary
    end 
    
    def short(str : String)
      @short = str
    end 
    
    def short
      @short
    end 
    
    def long(str : String)
      @long = str
    end 

  end
end
