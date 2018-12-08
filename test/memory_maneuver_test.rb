# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/memory_maneuver'

class AOC2018::MemoryManeuverTest < Minitest::Test
  INPUT = '2 3 0 3 10 11 12 1 1 0 1 99 2 1 1 2'.split.map(&:to_i).freeze

  def setup
    @mm = ::AOC2018::MemoryManeuver.new
  end

  def test_read_tree
    tree = [[[[], [10, 11, 12]], [[[[], [99]]], [2]]], [1, 1, 2]]
    assert_equal tree, @mm.read_tree(INPUT)
  end

  def test_sum_metadata
    assert_equal 138, @mm.sum_metadata(@mm.read_tree(INPUT))
  end
end
