# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/slice_it'

class AOC2018::SliceItTest < Minitest::Test
  CLAIMS = [
    '#1 @ 1,3: 4x4',
    '#2 @ 3,1: 4x4',
    '#3 @ 5,5: 2x2'
  ].freeze

  def setup
    @si = ::AOC2018::SliceIt.new
  end

  def test_overlap
    assert_equal 4, @si.overlap(CLAIMS)[1]
  end

end
