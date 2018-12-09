# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/extra/cli'

class AOC2018::CLITest < Minitest::Test
  def test_parse_params
    ['', 'one', nil].each do |p|
      refute ::AOC2018::Extra::CLI.parse_params([p])
    end

    refute ::AOC2018::Extra::CLI.parse_params([])

    ['1', '2', '25'].each do |p|
      assert_equal [p.to_i], ::AOC2018::Extra::CLI.parse_params([p])
    end

    assert_equal [1, 2, 25],
                 ::AOC2018::Extra::CLI.parse_params(['1', '2', '25'])
  end
end
