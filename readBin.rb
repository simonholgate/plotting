#!/usr/bin/ruby

aFile = File.new("attachment_0203dec19")
#
aFile.pos = 12
puts "Position: " + (aFile.pos).to_s 
#str = aFile.gets
#byte1 = aFile.getc
#byte2 = aFile.getc
#str = ""
#str << byte1
#str << byte2
#puts str.dump
#puts str.unpack("s")
#
#str = ""
#while aFile.pos <= 25
#  str << aFile.getc
#end
str = aFile.read(13)
puts str.unpack("s2,i,C,s2")
puts "Position: " + (aFile.pos).to_s 
#
aFile.close
puts aFile.closed?
