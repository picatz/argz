module Argz

  module Format
    def self.command(str : String)
      Argz::App.bin + " " + str
    end
  end
  
end
