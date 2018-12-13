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
      state = initial_state(input)
      r = rules(input)

      gen = state.dup
      20.times do
        gen = next_gen(gen, r)
      end

      puts "Part 1: #{sum_state(gen)}"

      (state, gen) = find_stability(state, r)
      puts "Part 2: #{sum_state(state, 50_000_000_000 - gen)}"
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

    def find_stability(state, rules)
      gen = 0
      saved = state[0][state[1].abs..state[0].rindex('#')]

      loop do
        state = next_gen(state, rules)
        gen += 1
        test = state[0][state[0].index('#')..state[0].rindex('#')]

        return [state, gen] if test == saved

        saved = test
      end
    end

    def sum_state((state, index), base = 0)
      state.chars.reduce(0) do |sum, c|
        sum += (c == '#' ? index + base : 0)
        index += 1

        sum
      end
    end
  end
end
