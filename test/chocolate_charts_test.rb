# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/chocolate_charts'

class AOC2018::ChocolateChartsTest < Minitest::Test
  def setup
    @cc = AOC2018::ChocolateCharts.new
  end

  def test_practice_scores
    assert_equal '0124515891', @cc.practice_scores(5)
    assert_equal '5158916779', @cc.practice_scores(9)
    assert_equal '9251071085', @cc.practice_scores(18)
    assert_equal '5941429882', @cc.practice_scores(2018)
  end
end
