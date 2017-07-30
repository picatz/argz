module Argz
  module Errors
    # Errors that happen because of argument index failures.
    # Like if you're looking up an argument that doesn't exist,
    # or cannot identify a given argument for some other reason.
    class Argument < Exception
    end
  end
end
