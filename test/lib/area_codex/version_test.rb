require_relative '../../test_helper'

class VersionTest < Test::Unit::TestCase

  def test_version
    assert_equal( false, AreaCodex::VERSION.nil? )
  end

end
