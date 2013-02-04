require_relative '../../test_helper'

class AreaCodeListTest < Test::Unit::TestCase

  def setup
    @file_name = 'canada.txt'
    @area_code_list = AreaCodes::AreaCodeList.new(@file_name)
  end

  def test_initialize
    assert_equal( true, @area_code_list.area_codes.instance_of?(Set) )
    assert_equal( false, @area_code_list.area_codes.empty? )
  end

  def test_include?
    assert_equal( true, @area_code_list.include?(604) )
    assert_equal( false, @area_code_list.include?(666) )
  end

  def test_exclude?
    assert_equal( false, @area_code_list.exclude?(604) )
    assert_equal( true, @area_code_list.exclude?(666) )
  end
end
