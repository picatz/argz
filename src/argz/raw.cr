module Argz
  # Provide a friendly raw base module to the the raw command-line arguments.
  module Raw
    def self.add(str : String | Array(String))
      case str
      when String
        ARGV << str
      when Array(String)
        str.each do |s|
          ARGV << s
        end
      end
    end
    
    def self.delete(str : String | Array(String))
      case str
      when String
        ARGV.delete(str)
      when Array(String)
        str.each do |s|
          ARGV.delete(str)
        end
      end
    end

    def self.delete_all
      until ARGV.empty?
        ARGV.each do |arg|
          ARGV.delete(arg)
        end
      end
    end

    # Enumerate over each element in the argument list.
    def self.each
      ARGV.each do |argument|
        yield argument
      end
    end

    # Detect if there are any arguments. Sometimes you don't have any to mess with.
    def self.any?
      if ARGV.empty?
        return false
      else
        return true
      end
    end

    # Direct access to all of the elements in the arguments list.
    def self.all
      ARGV
    end

    # The size ( count of elements ) of the argument list.
    def self.size
      ARGV.size
    end
    
    def self.is_flag_like?(flag : String)
      return true if flag.split("").first == "-"
      false
    end

    def self.is_flag?(flag : String)
      return false unless is_flag_like?(flag)
      return true if includes?(flag)
      false
    end

    # Find the index (relative number) of the argument in the argument list.
    def self.index_of(flag : String) : Int32 | Nil
      return nil unless includes?(flag)
      i = ARGV.index(flag)
      unless i.nil?
        return i.to_s.to_i # Since the object can be nil, force it to an integer.
      end
      raise Argz::Errors::Argument.new("There's no index for the given argument #{flag}!")
    end
    
    # Find the index (relative number) of the argument in the argument list.
    def self.index_of?(flag : String) : Bool
      return false unless includes?(flag)
      i = ARGV.index(flag)
      return true
    end

    # Find the argument to a given string in the raw index.
    def self.argument_to(flag : String) : String | Nil
      begin
        index = index_of(flag)
        return index if index.nil?
        arg = ARGV[index + 1]
        if is_flag?(arg)
          raise Argz::Errors::Argument.new("There's no argument for the given flag #{flag}!")
        end
        return arg
      rescue
        raise Argz::Errors::Argument.new("There's no argument for the given flag #{flag}!")
      end
    end
    
    # Check if the raw command-line arguments includes a given string.
    def self.includes?(flag : String)
      ARGV.includes?(flag)
    end

    # Find out if there's an argument to a given flag.
    def self.argument_to?(flag : String)
      begin 
        return true if argument_to(flag)
      rescue
        return false
      end 
    end

    # Find out if there's at least one or more arguments to a given flag.
    def self.arguments_to?(flag : String) : Bool 
      !arguments_to(flag).empty?
    end
    
    # When given a block.
    def self.arguments_to(flag : String)
      begin
        return nil unless includes?(flag)
        index = index_of(flag)
        index = index.to_s.to_i
        counter = 0
        ARGV.each do |argument|
          counter += 1
          next if index >= counter - 1
          next if argument == ","
          break if is_flag?(argument)
          yield argument
        end
      rescue
        raise Argz::Errors::Argument.new("There's no index for the given argument #{flag}!")
      end
    end

    # When not given a block.
    def self.arguments_to(flag : String)
      args = [] of String
      arguments_to(flag) do |arg|
        args << arg
      end
      args
    end

    # Find the index of the argument to a given flag.
    def self.argument_index_of(flag : String) : Int32
      begin
        return nil unless includes?(flag)
        return index_of(argument_to(flag))
      rescue
        raise Argz::Errors::Argument.new("There's no argument index for the given argument #{flag}!")
      end
    end

  end
end
