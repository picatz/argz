module Argz

  class DSL
    def self.build
      new.build do |builder|
        with builder yield builder
      end
    end

    def build
      with self yield self
      return self
    end
  end
end
