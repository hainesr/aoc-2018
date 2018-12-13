# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class SubterraneanSustainability < Day
    def run
      input = read_input_file.chomp.split("\n")
      gen = initial_state(input)
      r = rules(input)

      20.times do
        gen = next_gen(gen, r)
      end

      puts "Part 1: #{sum_state(gen)}"
    end

    def initial_state(input)
      ['.....' + input[0][15..-1], -5]
    end

    def rules(input)
      rules = {}

      input[2..-1].each do |line|
        rules[line[0..4]] = line[-1]
      end

      rules
    end

    def next_gen((state, index), rules)
      new_state = state.dup + '..'
      len = new_state.length - 4

      (0..len).each do |i|
        key = state[i...(i + 5)]
        key += ('.' * (5 - key.length))

        new_state[i + 2] = (rules[key].nil? ? '.' : rules[key])
      end

      lead = 5 - new_state.index('#')
      if lead.positive?
        new_state = ('.' * lead) + new_state
        index -= lead
      end

      [new_state[0..new_state.rindex('#')], index]
    end

    def sum_state((state, index))
      state.chars.reduce(0) do |sum, c|
        sum += (c == '#' ? index : 0)
        index += 1

        sum
      end
    end
  end
end
