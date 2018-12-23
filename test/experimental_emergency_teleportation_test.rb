# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/experimental_emergency_teleportation'

class AOC2018::ExperimentalEmergencyTeleportationTest < Minitest::Test
  INPUT = [
    'pos=<0,0,0>, r=4',
    'pos=<1,0,0>, r=1',
    'pos=<4,0,0>, r=3',
    'pos=<0,2,0>, r=1',
    'pos=<0,5,0>, r=3',
    'pos=<0,0,3>, r=1',
    'pos=<1,1,1>, r=1',
    'pos=<1,1,2>, r=1',
    'pos=<1,3,1>, r=1'
  ].freeze

  PARSED = {
    [0, 0, 0] => 4,
    [1, 0, 0] => 1,
    [4, 0, 0] => 3,
    [0, 2, 0] => 1,
    [0, 5, 0] => 3,
    [0, 0, 3] => 1,
    [1, 1, 1] => 1,
    [1, 1, 2] => 1,
    [1, 3, 1] => 1
  }.freeze

  def setup
    @eet = AOC2018::ExperimentalEmergencyTeleportation.new
  end

  def test_parse_input
    assert_equal PARSED, @eet.parse_input(INPUT)
  end

  def test_find_strongest
    assert_equal [[0, 0, 0], 4], @eet.find_strongest(PARSED)
  end

  def test_in_range
    assert_equal 7, @eet.in_range(PARSED)
  end
end
