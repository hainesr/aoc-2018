# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/chronal_charge'

class AOC2018::ChronalChargeTest < Minitest::Test
  def setup
    @cc = AOC2018::ChronalCharge.new
  end

  def test_cell_power_level
    assert_equal 4, @cc.cell_power_level(3, 5, 8)
    assert_equal(-5, @cc.cell_power_level(122, 79, 57))
    assert_equal 0, @cc.cell_power_level(217, 196, 39)
    assert_equal 4, @cc.cell_power_level(101, 153, 71)
  end

  def test_find_largest_region
    grid18 = @cc.populate_grid(18)
    grid42 = @cc.populate_grid(42)

    assert_equal [29, 3, [33, 45]], @cc.find_largest_region(grid18)
    assert_equal [30, 3, [21, 61]], @cc.find_largest_region(grid42)

    # Skip these tests for now as they take ages :-(
    # assert_equal [113, 16, [90, 269]], @cc.find_highest_power(grid18)
    # assert_equal [119, 12, [232, 251]], @cc.find_highest_power(grid42)
  end
end
