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

  def setup
    @im = ::AOC2018::InventoryManagement.new
  end

  def test_checksum
    assert_equal 12, @im.checksum(BOXES_1)
  end

end
