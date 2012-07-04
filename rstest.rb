#!/usr/bin/ruby1.8 -rubygems
require 'rsruby'

r = RSRuby.instance
res = r.wilcox_test([1,2,3], [4,5,6])
puts res

puts res["statistic"]['W']

e = r.seq(:from=>1, :to=>10)
r.png('junk2.png')
r.plot(:x=>e, :y=>e, :main=>'Test 2', :xlab=>'X', :ylab=>'Y', :type=>'l', 
  :col=>'blue')
r.dev_off(2)

r.png('junk3.png')
r.plot(e, e, :main=>'Test 2', :xlab=>'X', :ylab=>'Y', :type=>'l', :col=>'red')
r.dev_off(2)

r.plot(e, e, :main=>'Test 2', :xlab=>'X', :ylab=>'Y', :type=>'l', :col=>'red')
sleep(2)

