# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/four_dimensional_adventure'

class AOC2018::FourDimensionalAdventureTest < Minitest::Test
  INPUT1 = [
    '0,0,0,0',
    '3,0,0,0',
    '0,3,0,0',
    '0,0,3,0',
    '0,0,0,3',
    '0,0,0,6',
    '9,0,0,0',
    '12,0,0,0'
  ].freeze

  POINTS1 = [
    [0, 0, 0, 0].freeze,
    [3, 0, 0, 0].freeze,
    [0, 3, 0, 0].freeze,
    [0, 0, 3, 0].freeze,
    [0, 0, 0, 3].freeze,
    [0, 0, 0, 6].freeze,
    [9, 0, 0, 0].freeze,
    [12, 0, 0, 0].freeze
  ].freeze

  def setup
    @fda = ::AOC2018::FourDimensionalAdventure.new
  end

  def test_read_points
    assert_equal POINTS1, @fda.read_points(INPUT1)
  end

  def test_manhattan
    assert_equal 3, @fda.manhattan(POINTS1[0], POINTS1[1])
    assert_equal 6, @fda.manhattan(POINTS1[2], POINTS1[3])
    assert_equal 3, @fda.manhattan(POINTS1[4], POINTS1[5])
    assert_equal 3, @fda.manhattan(POINTS1[6], POINTS1[7])
  end
end
