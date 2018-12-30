# frozen_string_literal: true

# Advent of Code 2018
#
# Robert Haines
#
# Public Domain

require 'aoc2018'

module AOC2018
  class ImmuneSystemSimulator < Day
    class Group
      SIDES = %i[immune_system infection].freeze

      attr_accessor :id, :side, :units, :hp, :weak, :immune,
                    :attack, :damage, :init

      def initialize(id, side, units, hp, weak, immune, attack, damage, init)
        @id = id
        @side = side
        @units = units
        @hp = hp
        @weak = weak
        @immune = immune
        @attack = attack
        @damage = damage
        @init = init
      end

      def alive?
        @units.positive?
      end

      def power
        @units * @attack
      end

      def hit(damage)
        @units -= damage / @hp
      end

      def do_damage_to(other)
        return 0 if other.immune.include?(@damage)

        other.weak.include?(@damage) ? power * 2 : power
      end
    end

    def run
      input = read_input_file.chomp.split("\n")
      groups = read_input(input)

      puts "Part 1: #{play(groups)}"
    end

    def play(groups)
      until Group::SIDES.any? { |side| groups.all? { |o| o.side == side } }
        targets = choose_targets(groups)
        break if targets.empty?

        groups.sort_by(&:init).reverse_each do |g|
          t = targets[g.id]
          next unless t && g.alive? && t.alive?

          t.hit(g.do_damage_to(t))
        end

        groups.select!(&:alive?)
      end

      groups.reduce(0) { |sum, g| g.alive? ? sum + g.units : sum }
    end

    def choose_targets(groups)
      targets = {}
      groups.sort_by { |g| [g.power, g.init] }.reverse_each do |g|
        best_dmg = [nil, 0]

        groups.each do |f|
          next if g.side == f.side

          dmg = g.do_damage_to(f)
          b = best_dmg[0]

          next unless dmg > best_dmg[1] ||
                      b &&
                      ((dmg == best_dmg[1] && f.power > b.power) ||
                      (dmg == best_dmg[1] && f.power == b.power &&
                      f.init > b.init))

          best_dmg = [f, dmg] unless targets.values.map(&:id).include?(f.id)
        end

        targets[g.id] = best_dmg[0] if best_dmg[0]
      end

      targets
    end

    def read_input(input)
      side = :immune_system
      input[1..-1].map.with_index do |line, i|
        next if line.empty?

        if line.include?('Infection')
          side = :infection
          next
        end

        weak = []
        immune = []
        units, hp, attack, init = line.scan(/\d+/).map(&:to_i)
        damage = line.scan(/(\w+) damage/).flatten.first.to_sym

        attributes = line.scan(/\((.*)\)/).flatten.first
        if attributes
          attributes.split('; ').each do |a|
            types = a.scan(/.* to (.*)/).flatten.first.split(', ').map(&:to_sym)
            a.include?('weak') ? weak += types : immune += types
          end
        end

        Group.new(i, side, units, hp, weak, immune, attack, damage, init)
      end.compact
    end
  end
end
