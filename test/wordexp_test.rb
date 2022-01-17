require 'test_helper'

class WordexpTest < Minitest::Test
  def test_constants
    assert_equal %w[hello wordexp], ::Wordexp.expand('hello wordexp')
  end

  def test_quotation
    assert_equal ['hello wordexp', 'more words'], ::Wordexp.expand("'hello wordexp' \"more words\"")
  end

  def test_environment_variable_expansion
    assert_equal [ENV['HOME']], ::Wordexp.expand('$HOME')
  end

  def test_tilde_expansion
    assert_equal ["#{ENV['HOME']}/bin"], ::Wordexp.expand('~/bin')
  end

  def test_command_substitution_backticks
    assert_equal ["#{ENV['HOME']}/bin"], ::Wordexp.expand('`echo ~/bin`')
  end

  def test_command_substitution_dollar_parentheses
    assert_equal ["#{ENV['HOME']}/bin"], ::Wordexp.expand('$(echo ~/bin)')
  end

  def test_error_badchar
    assert_raises(Wordexp::BadCharacterError) do
      ::Wordexp.expand('<nope>')
    end
  end

  def test_error_badval
    assert_raises(Wordexp::BadValueError) do
      ::Wordexp.expand('$DEFINITELY_DOES_NOT_EXIST')
    end
  end

  def test_error_cmdsub
    # cannot test this until there's a way to disable command substitution
  end

  def test_error_syntax
    assert_raises(Wordexp::SyntaxError) do
      ::Wordexp.expand('$(this is the command that never ends')
    end
  end
end
