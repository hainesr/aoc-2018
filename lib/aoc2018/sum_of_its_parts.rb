# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class SumOfItsParts < Day
    def run
      steps = parse_steps(read_input_file.chomp.split("\n"))

      puts "Part 1: #{order_steps(steps)}"
    end

    def order_steps(steps)
      result = ''

      until steps.empty?
        exe = steps.select { |_, v| v.empty? }.keys.min
        steps.delete(exe)
        steps.each { |_, v| v.delete(exe) }
        result += exe
      end

      result
    end

    def parse_steps(steps)
      list = {}

      steps.each do |step|
        i = step[36]
        j = step[5] # j is a dependency of i...

        list[i] ||= []
        list[j] ||= [] # to catch the 'first' element...
        list[i] << j
      end

      list
    end
  end
end
