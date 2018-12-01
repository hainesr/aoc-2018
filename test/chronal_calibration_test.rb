# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/chronal_calibration'

class AOC2018::ChronalCalibrationTest < Minitest::Test

  def setup
    @cc = ::AOC2018::ChronalCalibration.new
  end

  def test_add_freqs
    assert_equal 3, @cc.add_freqs([1, -2, 3, 1])
    assert_equal 3, @cc.add_freqs([1, 1, 1])
    assert_equal 0, @cc.add_freqs([1, 1, -2])
    assert_equal -6, @cc.add_freqs([-1, -2, -3])

  end

end
