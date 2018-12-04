# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/repose_record'

class AOC2018::ReposeRecordTest < Minitest::Test
  RECORDS = [
    '[1518-11-01 00:00] Guard #10 begins shift',
    '[1518-11-01 00:05] falls asleep',
    '[1518-11-01 00:25] wakes up',
    '[1518-11-01 00:30] falls asleep',
    '[1518-11-01 00:55] wakes up',
    '[1518-11-01 23:58] Guard #99 begins shift',
    '[1518-11-02 00:40] falls asleep',
    '[1518-11-02 00:50] wakes up',
    '[1518-11-03 00:05] Guard #10 begins shift',
    '[1518-11-03 00:24] falls asleep',
    '[1518-11-03 00:29] wakes up',
    '[1518-11-05 00:45] falls asleep',
    '[1518-11-04 00:36] falls asleep',
    '[1518-11-05 00:03] Guard #99 begins shift',
    '[1518-11-04 00:02] Guard #99 begins shift',
    '[1518-11-04 00:46] wakes up',
    '[1518-11-05 00:55] wakes up'
  ].freeze

  RECORDS_SORTED = [
    ['151811040002', 99],
    ['151811040036', :falls_asleep],
    ['151811040046', :wakes_up],
    ['151811050003', 99],
    ['151811050045', :falls_asleep],
    ['151811050055', :wakes_up]
  ].freeze

  RECORDS_MERGED = {
    10 => [0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0],
    99 => [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 2, 2, 2, 2, 2, 3, 2, 2, 2, 2, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0]
  }.freeze

  def setup
    @rr = ::AOC2018::ReposeRecord.new
  end

  def test_parse_record
    assert_equal ['151811010000', 10], @rr.parse_record(RECORDS[0])
    assert_equal ['151811012358', 99], @rr.parse_record(RECORDS[5])
    assert_equal ['151811020040', :falls_asleep], @rr.parse_record(RECORDS[6])
    assert_equal ['151811020050', :wakes_up], @rr.parse_record(RECORDS[7])
  end

  def test_parse_records
    assert_equal RECORDS_SORTED, @rr.parse_records(RECORDS[11..-1])
  end

  def test_merge_records
    result = @rr.merge_records(@rr.parse_records(RECORDS))

    assert_equal RECORDS_MERGED[10], result[10]
    assert_equal RECORDS_MERGED[99], result[99]
    assert_equal 50, result[10].reduce(&:+)
    assert_equal 30, result[99].reduce(&:+)
    assert_equal 2, result[10].max
    assert_equal 3, result[99].max
    assert_equal 24, result[10].index(2)
    assert_equal 45, result[99].index(3)
  end

  def test_strategy_one
    records = @rr.merge_records(@rr.parse_records(RECORDS))
    assert_equal 240, @rr.strategy_one(records)
  end
end
