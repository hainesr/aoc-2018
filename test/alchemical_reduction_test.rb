# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/alchemical_reduction'

class AOC2018::AlchemicalReductionTest < Minitest::Test
  def setup
    @ar = ::AOC2018::AlchemicalReduction.new
  end

  def test_reduction_reaction
    assert_equal '', @ar.reduction_reaction('aA')
    assert_equal '', @ar.reduction_reaction('abBA')
    assert_equal 'abAB', @ar.reduction_reaction('abAB')
    assert_equal 'aabAAB', @ar.reduction_reaction('aabAAB')
    assert_equal 'dabCBAcaDA', @ar.reduction_reaction('dabAcCaCBAcCcaDA')
  end
end
