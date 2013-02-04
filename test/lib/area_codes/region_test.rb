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

  def test_include?
    assert_equal( true, region(@real_name).include?(604) )
    assert_equal( false, region(@real_name).include?(666) )
   end

  def test_exclude?
    assert_equal( false, region(@real_name).exclude?(604) )
    assert_equal( true, region(@real_name).exclude?(666) )
  end
end
