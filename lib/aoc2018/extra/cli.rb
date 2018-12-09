# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  module Extra
    module CLI
      def self.parse_params(argv)
        return false if argv.empty?

        argv.map(&:to_i).each do |day|
          return false if day < 1 || day > 25
        end
      end

      def self.run_day(day)
        solution = AOC2018::DAY_MAP[day]

        begin
          require ::File.join('aoc2018', solution)
        rescue StandardError
          solution = 'day'
        end

        AOC2018.class_from_day(solution).new.run
      end
    end
  end
end
