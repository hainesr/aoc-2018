# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class ReposeRecord < Day
    def run
      input = read_input_file.split("\n").map(&:chomp)
      records = merge_records(parse_records(input))

      puts "Part 1: #{strategy_one(records)}"
      puts "Part 2: #{strategy_two(records)}"
    end

    def strategy_one(records)
      max = [0, -1, -1, 0]
      records.each do |key, value|
        sum = value.reduce(&:+)
        if sum > max[1]
          m = value.max
          max = [key, sum, m, value.index(m)]
        end
      end

      max[0] * max[3]
    end

    def strategy_two(records)
      max = [0, -1, 0]
      records.each do |key, value|
        m = value.max
        max = [key, m, value.index(m)] if m > max[1]
      end

      max[0] * max[2]
    end

    def merge_records(records)
      merged = {}
      guard = 0
      start_min = 0

      records.each do |time, status|
        if status.is_a?(Integer)
          guard = status
          merged[guard] = Array.new(60, 0) if merged[guard].nil?
        else
          min = time[-2..-1].to_i

          if status == :falls_asleep
            start_min = min
          else
            (start_min...min).each do |m|
              merged[guard][m] += 1
            end
          end
        end
      end

      merged
    end

    def parse_records(records)
      records.map { |r| parse_record(r) }.sort_by { |s| s[0] }
    end

    def parse_record(record)
      bits = record.split
      timestamp = bits[0..1].join[1..-2].delete('-').delete(':')
      state = if bits[2] == 'Guard'
                bits[3][1..-1].to_i
              else
                "#{bits[2]}_#{bits[3]}".to_sym
              end

      [timestamp, state]
    end
  end
end
