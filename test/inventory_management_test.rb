# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/inventory_management'

class AOC2018::InventoryManagementTest < Minitest::Test
  BOXES_1 = [
    'abcdef',
    'bababc',
    'abbcde',
    'abcccd',
    'aabcdd',
    'abcdee',
    'ababab'
  ].freeze

  BOXES_2 = [
    'abcde',
    'fghij',
    'klmno',
    'pqrst',
    'fguij',
    'axcye',
    'wvxyz'
  ].freeze

  def setup
    @im = ::AOC2018::InventoryManagement.new
  end

  def test_checksum
    assert_equal 12, @im.checksum(BOXES_1)
  end

  def test_common_letters
    assert_equal 'fgij', @im.common_letters(BOXES_2)
  end
end
