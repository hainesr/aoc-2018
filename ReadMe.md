# Advent of Code 2018
## Robert Haines

My attempt at doing [Advent of Code 2018](http://adventofcode.com/2018) in Ruby, with tests and all the trimmings.

[![Build Status](https://travis-ci.org/hainesr/aoc-2018.svg?branch=master)](https://travis-ci.org/hainesr/aoc-2018)
[![Maintainability](https://api.codeclimate.com/v1/badges/79ce9638f67f5efdcbd4/maintainability)](https://codeclimate.com/github/hainesr/aoc-2018/maintainability)

### Usage

After cloning, and changing into the `aoc-2018` directory, run:

```shell
$ gem install bundler
$ bundle install
$ rake
```

This will set everything up and run all the tests.

To run the solution for a particular day:

```shell
$ ./aoc-2018 <day>
```

Or via `rake`:

```shell
$ rake run <day>
```

You can run multiple days like this:

```shell
$ rake run <day_1> <day_2> ... <day_n>
```

### Licence

[Public Domain](http://unlicense.org).
