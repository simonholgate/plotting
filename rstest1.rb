#!/usr/bin/ruby1.8 -rubygems
require 'rsruby'

r = RSRuby.instance
#  Sigma = r.matrix(r.c(10,3,0,3,2,0,0,0,1), 3,3)
#  puts Sigma
#  Mean = r.c(1,2,3)
#  puts Mean
#  r.require("MASS")
#  x = r.mvrnorm(1000, Mean, Sigma)
#  puts x
  
  r.library("rgl")
#  r.open3d()
  
#  r.plot3d(x, :size=>3, :box=>FALSE)
  
#  r.plot3d( r.ellipse3d(Sigma, :centre=>Mean), :col=>"green", :alpha=>0.5, :add => TRUE)
mtcars = r.data(mtcars)
fit = r.lm(mpg ~ disp + cyl , mtcars)

r.open3d()
r.plot3d(r.ellipse3d(fit, :level => 0.90), :col=>"blue", :alpha=>0.5, :aspect=>TRUE)
r.dev2bitmap("junk3d.png")

sleep(2)

