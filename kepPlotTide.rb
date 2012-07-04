#!/usr/bin/ruby1.8 -rubygems
require 'rsruby'

# First argument is the name of the data file
file_in = ARGV[0]

# Read in file. TASK2000 format files have 20 header lines which can be 
# skipped or just printed out to the screen.

f = File.open(file_in) 
for i in 0..19 
  puts f.readline
end

# Read 20 lines to check the time difference
time = Array(140130)
for i in 0..140129
  data = f.readline
  time[i] = data.split("s+")[4].to_f
end

f.close

# Create new R instance
r = RSRuby.instance

#data = r.read_table(:file => file_in, :col_names => ["seq",
#  "flag", "year", "yd", "time", "pr1", "pr2", "temp", "ch9", "ch10"], 
#  :nrows=>20, :skip=>20, :colClasses=["integer", "integer", "integer", 
#  "integer", "POSIXct", "numeric", "numeric", "numeric", "numeric", "numeric"])

time_diff = r.diff(time)

#puts "Time: "
#puts time
puts "Difference 1: " 
puts time_diff[1]

max_diff = r.max(time_diff)
pos = r.which(time_diff==max_diff)

puts "Max diff of " + max_diff.to_s + " at " + pos[0].to_s

# Plots
#r.png('junk2.png')
#r.plot(:x=>e, :y=>e, :main=>'Test 2', :xlab=>'X', :ylab=>'Y', :type=>'l', 
#  :col=>'blue')
#r.dev_off(2)

#r.png('junk3.png')
#r.plot(e, e, :main=>'Test 2', :xlab=>'X', :ylab=>'Y', :type=>'l', :col=>'red')
#r.dev_off(2)

#r.plot(e, e, :main=>'Test 2', :xlab=>'X', :ylab=>'Y', :type=>'l', :col=>'red')
#sleep(2)

