# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'rubygems'
require 'bundler/setup'

require 'aoc2018/day'

module AOC2018
  INPUT_DIR = ::File.expand_path('../etc', __dir__)

  DAY_MAP = [
    nil,
    'chronal_calibration',
    'inventory_management',
    'slice_it',
    'repose_record',
    'alchemical_reduction',
    'chronal_coordinates',
    'sum_of_its_parts',
    'memory_maneuver',
    'marble_mania',
    'stars_align',
    'chronal_charge',
    'subterranean_sustainability',
    'mine_cart_madness',
    'chocolate_charts',
    nil,
    'chronal_classification',
    nil,
    'north_pole_settlers',
    'go_with_the_flow',
    nil,
    nil,
    'mode_maze',
    'experimental_emergency_teleportation',
    'immune_system_simulator',
    'four_dimensional_adventure'
  ].freeze

  def self.class_from_day(day)
    class_name = day.split('_').map(&:capitalize).join
    class_path = "AOC2018::#{class_name}"
    class_path.split('::').reduce(Object) { |o, c| o.const_get c }
  end
end
