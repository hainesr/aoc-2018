# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/experimental_emergency_teleportation'

class AOC2018::ExperimentalEmergencyTeleportationTest < Minitest::Test
  INPUT1 = [
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

  PARSED1 = {
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

  INPUT2 = [
    'pos=<10,12,12>, r=2',
    'pos=<12,14,12>, r=2',
    'pos=<16,12,12>, r=4',
    'pos=<14,14,14>, r=6',
    'pos=<50,50,50>, r=200',
    'pos=<10,10,10>, r=5'
  ].freeze

  def setup
    @eet = AOC2018::ExperimentalEmergencyTeleportation.new
  end

  def test_parse_input
    assert_equal PARSED1, @eet.parse_input(INPUT1)
  end

  def test_find_strongest
    assert_equal [[0, 0, 0], 4], @eet.find_strongest(PARSED1)
  end

  def test_in_range
    assert_equal 7, @eet.in_range(PARSED1)
  end

  def test_most_in_range
    bots = @eet.parse_input(INPUT2)
    assert_equal [12, 12, 12], @eet.most_in_range(bots)
  end
end
