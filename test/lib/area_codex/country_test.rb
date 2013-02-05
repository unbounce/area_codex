require_relative '../../test_helper'

class TestCounty < MiniTest::Unit::TestCase
  
    def setup
      @fake_name = 'Freeside'
      @real_name = 'Canada'
    end

    def country(name)
      AreaCodex::Country.new(name)
    end

    def test_initialize
      assert_equal( true, country(@fake_name).instance_of?(AreaCodex::Country) )
      assert_equal( true, country(@real_name).instance_of?(AreaCodex::Country) )
    end

    def test_include?
      [@fake_name, @fake_name.to_sym].each do |name|
        assert_equal( false, country(name).include?(604) )
        assert_equal( false, country(name).include?(666) )
      end

      [@real_name, @real_name.to_s].each do |name|
        assert_equal( true, country(name).include?(604) )
        assert_equal( false, country(name).include?(666) )
      end
    end

    def test_exclude?
      assert_equal( true, country(@fake_name).exclude?(604) )
      assert_equal( true, country(@fake_name).exclude?(666) )

      assert_equal( false, country(@real_name).exclude?(604) )
      assert_equal( true, country(@real_name).exclude?(666) )
    end

end
