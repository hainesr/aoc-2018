# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/extra/union_find'

class AOC2018::UnionFindTest < Minitest::Test
  DATA = %i[a b c d e f g].freeze

  def setup
    @uf = ::AOC2018::Extra::UnionFind.new(DATA)
  end

  def test_plain
    DATA.each { |x| assert_equal x, @uf.find(x) }
    assert_equal DATA.length, @uf.disjoint_sets
  end

  def test_union_find
    @uf.union(:a, :g)
    assert_equal (DATA.length - 1), @uf.disjoint_sets
    assert_equal :a, @uf.find(:a)
    assert_equal :a, @uf.find(:g)

    @uf.union(:b, :f)
    assert_equal (DATA.length - 2), @uf.disjoint_sets
    assert_equal :b, @uf.find(:b)
    assert_equal :b, @uf.find(:f)

    @uf.union(:c, :e)
    @uf.union(:e, :d)
    assert_equal 3, @uf.disjoint_sets
    assert_equal :c, @uf.find(:c)
    assert_equal :c, @uf.find(:e)
    assert_equal :c, @uf.find(:d)

    @uf.union(:f, :g)
    assert_equal 2, @uf.disjoint_sets
    assert_equal :b, @uf.find(:b)
    assert_equal :b, @uf.find(:a)
    assert_equal :b, @uf.find(:g)
    assert_equal :b, @uf.find(:f)
  end
end
