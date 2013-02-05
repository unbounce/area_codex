require_relative '../../test_helper'

#class RegionTest < Test::Unit::TestCase
class TestRegion < MiniTest::Unit::TestCase

  def setup
    @fake_name = 'Freeside'
    @real_name = 'North America'
  end

  def region(name)
    AreaCodex::Region.new(name)
  end

  def test_initialize
    assert_raises( NameError ) { AreaCodex::Region.new(@fake_name) }
    assert_equal( true, region(@real_name).instance_of?(AreaCodex::Region) )
  end

  def test_include?
    [@real_name, @real_name.to_sym].each do |name|
      assert_equal( true, region(name).include?(604) )
      assert_equal( false, region(name).include?(666) )
    end
  end

  def test_exclude?
    [@real_name, @real_name.to_sym].each do |name|
      assert_equal( false, region(name).exclude?(604) )
      assert_equal( true, region(name).exclude?(666) )
    end
  end
end
