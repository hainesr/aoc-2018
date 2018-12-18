# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/north_pole_settlers'

class AOC2018::NorthPoleSettlersTest < Minitest::Test
  INPUT = [
    '.#.#...|#.',
    '.....#|##|',
    '.|..|...#.',
    '..|#.....#',
    '#.#|||#|#|',
    '...#.||...',
    '.|....|...',
    '||...#|.#|',
    '|.||||..|.',
    '...#.|..|.'
  ].freeze

  MINUTE = [
    '............'.chars,
    '........##..'.chars,
    '.......|###.'.chars,
    '..|..|...#..'.chars,
    '...|#||...#.'.chars,
    '...##||.|#|.'.chars,
    '....#||||...'.chars,
    '.||...|||...'.chars,
    '.|||||.||.|.'.chars,
    '.||||||||||.'.chars,
    '.....||..|..'.chars,
    '............'.chars
  ].freeze

  def setup
    @nps = ::AOC2018::NorthPoleSettlers.new
  end

  def test_blank_map
    assert_equal [['.']], @nps.blank_map(1, 1)
    assert_equal [['.', '.'], ['.', '.']], @nps.blank_map(2, 2)
    assert_equal [['.', '.', '.'], ['.', '.', '.']], @nps.blank_map(3, 2)
    assert_equal [['.', '.'], ['.', '.'], ['.', '.']], @nps.blank_map(2, 3)
  end

  def test_tick
    map = @nps.load_map(INPUT)
    assert_equal MINUTE, @nps.tick(map)
  end

  def test_part_one
    map = @nps.load_map(INPUT)
    10.times { map = @nps.tick(map) }

    assert_equal 1147, @nps.calculate_resources(map)
  end
end
