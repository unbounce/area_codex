require_relative '../../test_helper'

class AreaCodeListTest < Test::Unit::TestCase

  def setup
    @single = 'canada.txt'
    @multiple = ['canada.txt', 'mexico.txt']
  end

  def list(file_names)
    AreaCodes::AreaCodeList.new(file_names)
  end

  def test_initialize
    assert_equal( true, list(@single).area_codes.instance_of?(Set) )
    assert_equal( false, list(@single).area_codes.empty? )
  end

  def test_include?
    assert_equal( true, list(@single).include?(604) )
    assert_equal( false, list(@single).include?(666) )
  end

  def test_exclude?
    assert_equal( false, list(@single).exclude?(604) )
    assert_equal( true, list(@single).exclude?(666) )
  end
end
