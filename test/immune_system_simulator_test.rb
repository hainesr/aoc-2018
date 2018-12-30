# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'test_helper'
require 'aoc2018/immune_system_simulator'

class AOC2018::ImmuneSystemSimulatorTest < Minitest::Test
  SINGLE = [
    '',
    '18 units each with 729 hit points (weak to fire; immune to cold, slashing)
    with an attack that does 8 radiation damage at initiative 10'
  ].freeze

  SINGLE_PARSED = [
    AOC2018::ImmuneSystemSimulator::Group.new(
      0, :immune_system, 18, 729, [:fire],
      %i[cold slashing], 8, :radiation, 10
    )
  ].freeze

  GROUPS = [
    'Immune System:',
    '17 units each with 5390 hit points (weak to radiation, bludgeoning) ' \
    'with an attack that does 4507 fire damage at initiative 2',
    '989 units each with 1274 hit points (immune to fire; weak to ' \
    'bludgeoning, slashing) with an attack that does 25 slashing damage ' \
    'at initiative 3',
    '',
    'Infection:',
    '801 units each with 4706 hit points (weak to radiation) with an ' \
    'attack that does 116 bludgeoning damage at initiative 1',
    '4485 units each with 2961 hit points (immune to radiation; weak to ' \
    'fire, cold) with an attack that does 12 slashing damage at initiative 4'
  ].freeze

  def setup
    @iss = AOC2018::ImmuneSystemSimulator.new
  end

  def test_read_input
    SINGLE_PARSED.length.times do |i|
      check_group(SINGLE_PARSED[i], @iss.read_input(SINGLE)[i])
    end

    groups = @iss.read_input(GROUPS)
    assert_equal 4, groups.length
    assert_equal 76_619, groups[0].power
    assert_equal 53_820, groups[3].power
  end

  def test_play
    groups = @iss.read_input(GROUPS)
    assert_equal 5216, @iss.play(groups)
  end

  def check_group(expected, actual)
    %i[side units hp weak immune attack damage init power].each do |atr|
      assert_equal expected.send(atr), actual.send(atr)
    end
  end
end
