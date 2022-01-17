module Wordexp
  class CLI
    def call(string)
      puts Wordexp.expand(string).inspect
    end
  end
end
