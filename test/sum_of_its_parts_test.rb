# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/sum_of_its_parts'

class AOC2018::SumOfItsPartsTest < Minitest::Test
  STEPS = [
    'Step C must be finished before step A can begin.',
    'Step C must be finished before step F can begin.',
    'Step A must be finished before step B can begin.',
    'Step A must be finished before step D can begin.',
    'Step B must be finished before step E can begin.',
    'Step D must be finished before step E can begin.',
    'Step F must be finished before step E can begin.'
  ].freeze

  PARSED = {
    'A' => ['C'],
    'C' => [],
    'F' => ['C'],
    'B' => ['A'],
    'D' => ['A'],
    'E' => ['B', 'D', 'F']
  }.freeze

  def setup
    @sp = ::AOC2018::SumOfItsParts.new
  end

  def test_parse_steps
    assert_equal PARSED, @sp.parse_steps(STEPS)
  end

  def test_order_steps
    steps = @sp.parse_steps(STEPS)

    assert_equal 'CABDFE', @sp.order_steps(steps)
  end
end
