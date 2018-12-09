# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'
require 'aoc2018/extra/ring_buffer'

module AOC2018
  class MarbleMania < Day
    def run
      puts "Part 1: #{high_score(468, 71_843)}"
      puts "Part 2: #{high_score(468, 7_184_300)}"
    end

    def high_score(player_count, last_marble)
      players = Array.new(player_count, 0)
      circle = Extra::RingBufferNode.new(0)

      (23..last_marble).step(23) do |marble|
        (marble - 22...marble).each do |m|
          circle = circle.next.insert(m)
        end

        6.times { circle = circle.prev }
        removed_marble = circle.prev.remove

        current_player = (marble - 1) % player_count
        players[current_player] += marble + removed_marble
      end

      players.max
    end
  end
end
