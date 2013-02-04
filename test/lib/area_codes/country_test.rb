require_relative '../../test_helper'

class CountryTest < Test::Unit::TestCase

    def setup
      @fake_name = 'Freeside'
      @real_name = 'Canada'
    end

    def country(name)
      AreaCodes::Country.new(name)
    end

    def test_initialize
      assert_equal( true, country(@fake_name).instance_of?(AreaCodes::Country) )
      assert_equal( true, country(@real_name).instance_of?(AreaCodes::Country) )
    end

    def test_include?
      assert_equal( false, country(@fake_name).include?(604) )
      assert_equal( false, country(@fake_name).include?(666) )

      assert_equal( true, country(@real_name).include?(604) )
      assert_equal( false, country(@real_name).include?(666) )
    end

    def test_exclude?
      assert_equal( true, country(@fake_name).exclude?(604) )
      assert_equal( true, country(@fake_name).exclude?(666) )

      assert_equal( false, country(@real_name).exclude?(604) )
      assert_equal( true, country(@real_name).exclude?(666) )
    end

end
