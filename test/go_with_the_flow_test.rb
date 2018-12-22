# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/go_with_the_flow'

class AOC2018::GoWithTheFlowTest < Minitest::Test
  CODE = [
    '#ip 0',
    'seti 5 0 1',
    'seti 6 0 2',
    'addi 0 1 0',
    'addr 1 2 3',
    'setr 1 0 0',
    'seti 8 0 4',
    'seti 9 0 5'
  ].freeze

  def setup
    @gwtf = ::AOC2018::GoWithTheFlow.new
  end

  def test_run_program
    assert_equal [6, 5, 6, 0, 0, 9], @gwtf.run_program(CODE)
  end
end
