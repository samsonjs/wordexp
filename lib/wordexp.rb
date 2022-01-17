require 'wordexp_ext/wordexp_ext'

module Wordexp
  autoload :CLI, 'wordexp/cli'
  autoload :VERSION, 'wordexp/version'

  # Illegal occurrence of newline or one of |, &, ;, <, >, (, ), {, }.
  class BadCharacterError < StandardError; end

  # An undefined shell variable was referenced, and the WRDE_UNDEF flag told us to consider this an error.
  class BadValueError < StandardError; end

  # Command substitution requested, but the WRDE_NOCMD flag told us to consider this an error.
  class CommandSubstitutionError < StandardError; end

  # Out of memory.
  class NoSpaceError < StandardError; end

  # Shell syntax error, such as unbalanced parentheses or unmatched quotes.
  class SyntaxError < StandardError; end

  # An undocumented error occurred.
  class UndocumentedError < StandardError; end

  class << self
    def expand(string)
      result = Ext.wordexp(string)
      return result if result.is_a?(Array)

      case result
      when :wrde_badchar
        # FIXME: useful message that includes the position of the character
        raise BadCharacterError, 'Bad character'

      when :wrde_badval
        raise BadValueError, 'Bad value'

      when :wrde_cmdsub
        raise CommandSubstitutionError, 'Command substitution is disabled'

      when :wrde_nospace
        raise NoSpaceError, 'Out of memory'

      when :wrde_syntax
        raise SyntaxError, 'Bad value'

      else
        warn "wordexp returned an unexpected result: #{result.inspect}"
        raise UndocumentedError, 'An unknown error occurred'
      end
    end
  end
end
