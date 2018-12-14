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

  def test_next_ten
    scores = @cc.practice_scores(2_500)

    assert_equal '0124515891', @cc.next_ten(5, scores)
    assert_equal '5158916779', @cc.next_ten(9, scores)
    assert_equal '9251071085', @cc.next_ten(18, scores)
    assert_equal '5941429882', @cc.next_ten(2018, scores)
  end

  def test_find_sequence_index
    scores = @cc.practice_scores(2_500)

    assert_equal 9, @cc.find_sequence_index('51589', scores)
    assert_equal 5, @cc.find_sequence_index('01245', scores)
    assert_equal 18, @cc.find_sequence_index('92510', scores)
    assert_equal 2018, @cc.find_sequence_index('59414', scores)
  end
end
