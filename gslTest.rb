#!/usr/bin/ruby1.8
require 'gsl'

# plot Ex 1
x = Vector.linspace(0,20,100)
puts x
y = Sf::bessel_J0(x);
puts y
y.graph(x, "-T X -C -g 3 -L 'Bessel function J0(x)'")
# Ex 2
x = Vector[1..5]
x.graph("-m 2")      # dotted line
x.graph("-C -l x")   # color, x log scale
x.graph("-X \"X axis\"")  # with an axis label
# Ex 3
x = Vector.linspace(0, 2.0*M_PI, 20)
c = Sf::cos(x)
c.graph(x, "-T X -C -g 3 -L 'cos(x)'")
# Plotting functions
f = Function.alloc { |x| Math::sin(x) }
x = Vector.linspace(0, 2*M_PI, 50)
f.graph(x, "-T X -g 3 -C -L 'sin(x)'")

# Histogram
N = 10000
MAX = 8
rng = Rng.alloc

data = Ran.gaussian(rng, 1.5, N) + 2
h = Histogram.alloc(100, [-MAX, MAX])
h.increment(data)

sigma, mean, height, = h.fit_gaussian
x = Vector.linspace(-MAX, MAX, 100)
y = height*Ran::gaussian_pdf(x-mean, sigma)
GSL::graph(h, [x, y], "-T X -C -g 3")
