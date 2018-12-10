# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/stars_align'

class AOC2018::StarsAlignTest < Minitest::Test
  POINTS = [
    'position=< 9,  1> velocity=< 0,  2>',
    'position=< 7,  0> velocity=<-1,  0>',
    'position=< 3, -2> velocity=<-1,  1>',
    'position=< 6, 10> velocity=<-2, -1>',
    'position=< 2, -4> velocity=< 2,  2>',
    'position=<-6, 10> velocity=< 2, -2>',
    'position=< 1,  8> velocity=< 1, -1>',
    'position=< 1,  7> velocity=< 1,  0>',
    'position=<-3, 11> velocity=< 1, -2>',
    'position=< 7,  6> velocity=<-1, -1>',
    'position=<-2,  3> velocity=< 1,  0>',
    'position=<-4,  3> velocity=< 2,  0>',
    'position=<10, -3> velocity=<-1,  1>',
    'position=< 5, 11> velocity=< 1, -2>',
    'position=< 4,  7> velocity=< 0, -1>',
    'position=< 8, -2> velocity=< 0,  1>',
    'position=<15,  0> velocity=<-2,  0>',
    'position=< 1,  6> velocity=< 1,  0>',
    'position=< 8,  9> velocity=< 0, -1>',
    'position=< 3,  3> velocity=<-1,  1>',
    'position=< 0,  5> velocity=< 0, -1>',
    'position=<-2,  2> velocity=< 2,  0>',
    'position=< 5, -2> velocity=< 1,  2>',
    'position=< 1,  4> velocity=< 2,  1>',
    'position=<-2,  7> velocity=< 2, -2>',
    'position=< 3,  6> velocity=<-1, -1>',
    'position=< 5,  0> velocity=< 1,  0>',
    'position=<-6,  0> velocity=< 2,  0>',
    'position=< 5,  9> velocity=< 1, -2>',
    'position=<14,  7> velocity=<-2,  0>',
    'position=<-3,  6> velocity=< 2, -1>'
  ].freeze

  PARSED = [
    [9, 1, 0, 2],
    [7, 0, -1, 0],
    [3, -2, -1, 1],
    [6, 10, -2, -1],
    [2, -4, 2, 2],
    [-6, 10, 2, -2],
    [1, 8, 1, -1],
    [1, 7, 1, 0],
    [-3, 11, 1, -2],
    [7, 6, -1, -1],
    [-2, 3, 1, 0],
    [-4, 3, 2, 0],
    [10, -3, -1, 1],
    [5, 11, 1, -2],
    [4, 7, 0, -1],
    [8, -2, 0, 1],
    [15, 0, -2, 0],
    [1, 6, 1, 0],
    [8, 9, 0, -1],
    [3, 3, -1, 1],
    [0, 5, 0, -1],
    [-2, 2, 2, 0],
    [5, -2, 1, 2],
    [1, 4, 2, 1],
    [-2, 7, 2, -2],
    [3, 6, -1, -1],
    [5, 0, 1, 0],
    [-6, 0, 2, 0],
    [5, 9, 1, -2],
    [14, 7, -2, 0],
    [-3, 6, 2, -1]
  ].freeze

  OUTPUT =
  "#   #  ###\n#   #   # \n#   #   # \n#####   # \n#   #   # \n#   #   # \n#   #   # \n#   #  ###\n"

  def setup
    @sa = ::AOC2018::StarsAlign.new
  end

  def test_read_points
    assert_equal PARSED, @sa.read_points(POINTS)
  end

  def test_align
    aligned = @sa.align(@sa.read_points(POINTS), 7)

    assert_equal OUTPUT, @sa.output(aligned[0])
    assert_equal 3, aligned[1]
  end
end
