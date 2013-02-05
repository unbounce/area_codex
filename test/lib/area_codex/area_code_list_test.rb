require_relative '../../test_helper'

class TestAreaCodeList < MiniTest::Unit::TestCase

  def setup
    @single = 'canada.txt'
    @multiple = ['canada.txt', 'mexico.txt']
  end

  def list(file_names)
    AreaCodex::AreaCodeList.new(file_names)
  end

  def test_initialize
    [@single, @multiple].each do |list_size|
      assert_equal( true, list(list_size).area_codes.instance_of?(Set) )
      assert_equal( false, list(list_size).area_codes.empty? )
    end
  end

  def test_include?
    [@single, @multiple].each do |list_size|
      assert_equal( true, list(list_size).include?(604) )
      assert_equal( false, list(list_size).include?(666) )
    end
  end

  def test_exclude?
    [@single, @multiple].each do |list_size|
      assert_equal( false, list(list_size).exclude?(604) )
      assert_equal( true, list(list_size).exclude?(666) )
    end
  end
end
