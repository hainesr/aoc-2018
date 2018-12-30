# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/mine_cart_madness'

class AOC2018::MineCartMadnessTest < Minitest::Test
  MAP = [
    '/->-\\        ',
    '|   |  /----\\',
    '| /-+--+-\\  |',
    '| | |  | v  |',
    '\\-+-/  \\-+--/',
    '  \\------/   '
  ].freeze

  MAP2 = [
    '/>-<\\  ',
    '|   |  ',
    '| /<+-\\',
    '| | | v',
    '\\>+</ |',
    '  |   ^',
    '  \\<->/'
  ].freeze

  def setup
    @mcm = ::AOC2018::MineCartMadness.new
  end

  def test_cart_comparison
    c1 = AOC2018::MineCartMadness::Cart.new(0, 0, -1, 1)
    c2 = AOC2018::MineCartMadness::Cart.new(20, 10, -1, 1)
    c3 = AOC2018::MineCartMadness::Cart.new(20, 20, -1, 1)

    assert c1 < c2
    assert c2 < c3

    assert_equal [c1, c2, c3], [c3, c1, c2].sort
  end

  def test_read_map
    (_, carts) = @mcm.read_map(MAP)

    assert_equal 2, carts[0].x
    assert_equal 0, carts[0].y
    assert_equal 1, carts[0].xv
    assert_equal 0, carts[0].yv
  end

  def test_sim
    (map, carts) = @mcm.read_map(MAP)

    assert_equal [7, 3], @mcm.sim(map, carts)
  end

  def test_sim_remove
    (map, carts) = @mcm.read_map(MAP2)

    assert_equal [6, 4], @mcm.sim(map, carts, true)
  end
end
