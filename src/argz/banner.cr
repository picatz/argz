module Argz
  # Provide a friendly raw base class the raw command-line arguments.
  class Banner
    def initialize(name : String)
      @name = name
    end

    def small
      @name
    end

    def figlet
      if `which figlet`
        `echo #{@name} | figlet`
      else
        @name
      end
    end

    def toilet 
      if `which toilet`
        `echo #{@name} | toilet`
      else
        @name
      end
    end
  end
end
