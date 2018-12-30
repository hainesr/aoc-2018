# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/chronal_classification'

class AOC2018::ChronalClassificationTest < Minitest::Test
  TEST = [
    'Before: [3, 2, 1, 1]',
    '9 2 1 2',
    'After:  [3, 2, 2, 1]',
    ''
  ].freeze

  def setup
    @cc = ::AOC2018::ChronalClassification.new
  end

  def test_map_instructions
    assert_equal 1, @cc.map_instructions(TEST, false)
  end
end
