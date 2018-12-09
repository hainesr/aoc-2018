# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/marble_mania'

class AOC2018::MarbleManiaTest < Minitest::Test
  def setup
    @mm = ::AOC2018::MarbleMania.new
  end

  def test_high_score
    [
      [9, 25, 32],
      [10, 1_618, 8_317],
      [13, 7_999, 146_373],
      [17, 1_104, 2_764],
      [21, 6_111, 54_718],
      [30, 5_807, 37_305]
    ].each do |players, last_marble, high_score|
      assert_equal high_score, @mm.high_score(players, last_marble)
    end
  end
end
