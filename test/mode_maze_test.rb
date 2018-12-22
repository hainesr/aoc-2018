# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/mode_maze'

class AOC2018::ModeMazeTest < Minitest::Test
  def setup
    @mm = AOC2018::ModeMaze.new(510, [10, 10])
  end

  def test_erosion_index
    assert_equal 0, @mm.erosion_index(0, 0)
    assert_equal 0, @mm.erosion_index(10, 10)
  end

  def test_risk_level
    assert_equal 114, @mm.risk_level
  end
end
