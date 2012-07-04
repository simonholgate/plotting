#!/usr/local/bin/ruby

#require 'math'

inVal = ARGV[0]
sinVal = 2.5*Math.sin(inVal.to_i*Math::PI/360) + 2.5
puts sinVal
