require 'test_helper'

class WordexpTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Wordexp::VERSION
  end
end
