# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/subterranean_sustainability'

class AOC2018::SubterraneanSustainabilityTest < Minitest::Test
  INPUT = [
    'initial state: #..#.#..##......###...###',
    '',
    '...## => #',
    '..#.. => #',
    '.#... => #',
    '.#.#. => #',
    '.#.## => #',
    '.##.. => #',
    '.#### => #',
    '#.#.# => #',
    '#.### => #',
    '##.#. => #',
    '##.## => #',
    '###.. => #',
    '###.# => #',
    '####. => #'
  ].freeze

  INITAL = ['.....#..#.#..##......###...###', -5].freeze

  RULES = {
    '...##' => '#',
    '..#..' => '#',
    '.#...' => '#',
    '.#.#.' => '#',
    '.#.##' => '#',
    '.##..' => '#',
    '.####' => '#',
    '#.#.#' => '#',
    '#.###' => '#',
    '##.#.' => '#',
    '##.##' => '#',
    '###..' => '#',
    '###.#' => '#',
    '####.' => '#'
  }.freeze

  GEN_1 = ['.....#...#....#.....#..#..#..#', -5].freeze
  GEN_2 = ['.....##..##...##....#..#..#..##', -5].freeze
  GEN_3 = ['.....#.#...#..#.#....#..#..#...#', -6].freeze
  GEN_20 = ['.....#....##....#####...#######....#.#..##', -7].freeze

  def setup
    @ss = AOC2018::SubterraneanSustainability.new
  end

  def test_initial_state
    assert_equal INITAL, @ss.initial_state(INPUT)
  end

  def test_rules
    assert_equal RULES, @ss.rules(INPUT)
  end

  def test_next_gen
    assert_equal GEN_1, @ss.next_gen(INITAL, RULES)
    assert_equal GEN_2, @ss.next_gen(GEN_1, RULES)
    assert_equal GEN_3, @ss.next_gen(GEN_2, RULES)

    gen = INITAL
    20.times do
      gen = @ss.next_gen(gen, RULES)
    end

    assert_equal GEN_20, gen
  end

  def test_sum_state
    assert_equal 145, @ss.sum_state(INITAL)
    assert_equal 325, @ss.sum_state(GEN_20)
  end
end
