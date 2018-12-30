# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class MineCartMadness < Day
    class Cart
      include Comparable

      attr_accessor :x, :y, :xv, :yv, :dir_state, :tick

      def initialize(x, y, xv, yv)
        @x = x
        @y = y
        @xv = xv
        @yv = yv
        @dir_state = 0
        @tick = false
      end

      def <=>(other)
        if x == other.x
          y <=> other.y
        else
          x <=> other.x
        end
      end
    end

    def run
      input = read_input_file.chomp.split("\n")

      (map, carts) = read_map(input)
      crash = sim(map, carts)
      puts "Part 1: #{crash[0]},#{crash[1]}"

      (map, carts) = read_map(input)
      crash = sim(map, carts, true)
      puts "Part 2: #{crash[0]},#{crash[1]}"
    end

    # rubocop:disable Metrics/AbcSize, Metrics/BlockLength, Lint/EmptyWhen
    def sim(map, carts, remove = false)
      loop do
        carts.sort.each do |cart|
          x = cart.x + cart.xv
          y = cart.y + cart.yv
          collide = carts.find { |c| c.x == x && c.y == y }

          if collide
            return [x, y] unless remove

            carts.delete(cart)
            carts.delete(collide)

            if carts.length == 1
              return [carts[0].x, carts[0].y] if carts[0].tick

              return [carts[0].x + carts[0].xv, carts[0].y + carts[0].yv]
            end
          end

          cart.x = x
          cart.y = y
          case map[cart.y][cart.x]
          when '\\'
            cart.xv, cart.yv = cart.yv, cart.xv
          when '/'
            cart.xv, cart.yv = -cart.yv, -cart.xv
          when '+'
            case cart.dir_state
            when 0
              cart.xv, cart.yv = cart.yv, -cart.xv
            when 1
              # keep going straight
            when 2
              cart.xv, cart.yv = -cart.yv, cart.xv
            end

            cart.dir_state = (cart.dir_state + 1) % 3
          end
          cart.tick = true
        end

        # Reset tick...
        carts.each { |c| c.tick = false }
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/BlockLength, Lint/EmptyWhen

    def read_map(input)
      carts = []

      map = input.map.with_index do |line, y|
        line.chomp.chars.map.with_index do |c, x|
          case c
          when '<'
            carts << Cart.new(x, y, -1, 0)
            '-'
          when '>'
            carts << Cart.new(x, y, 1, 0)
            '-'
          when '^'
            carts << Cart.new(x, y, 0, -1)
            '|'
          when 'v'
            carts << Cart.new(x, y, 0, 1)
            '|'
          else
            c
          end
        end
      end

      [map, carts]
    end
  end
end
