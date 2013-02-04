require_relative '../../test_helper'

class RegionTest < Test::Unit::TestCase

  def setup
    @fake_name = 'Freeside'
    @real_name = 'North America'
  end

  def region(name)
    AreaCodes::Region.new(name)
  end

  def test_initialize
    assert_raise( NameError ) { AreaCodes::Region.new(@fake_name) }
    assert_equal( true, region(@real_name).instance_of?(AreaCodes::Region) )
  end

end
