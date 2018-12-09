# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/chronal_coordinates'

class AOC2018::ChronalCoordinatesTest < Minitest::Test
  POINTS = [
    [1, 1],
    [1, 6],
    [8, 3],
    [3, 4],
    [5, 5],
    [8, 9]
  ].freeze

  def setup
    @cc = ::AOC2018::ChronalCoordinates.new
  end

  def test_manhattan
    assert_equal 5, @cc.manhattan(POINTS[0], POINTS[1])
    assert_equal 6, @cc.manhattan(POINTS[2], POINTS[3])
    assert_equal 7, @cc.manhattan(POINTS[4], POINTS[5])
  end

  def test_closest
    assert_equal 0, @cc.closest(POINTS, 2, 2)
    assert_nil @cc.closest(POINTS, 8, 6)
  end

  def test_closest_within_sum
    assert @cc.closest_within_sum?(POINTS, 4, 3, 32)
    assert @cc.closest_within_sum?(POINTS, 6, 5, 32)
    refute @cc.closest_within_sum?(POINTS, 4, 2, 32)
    refute @cc.closest_within_sum?(POINTS, 0, 0, 32)
  end

  def test_max_finite_area
    assert_equal 17, @cc.max_finite_area(POINTS)
  end

  def test_region_within_sum
    assert_equal 16, @cc.region_within_sum(POINTS, 32)
  end
end
