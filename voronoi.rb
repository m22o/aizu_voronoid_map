require 'ruby_vor'
require 'pp'
require 'pry'

points = [
  RubyVor::Point.new(120, 290),
  RubyVor::Point.new(110, 120),
  RubyVor::Point.new(160, 90.2),
  RubyVor::Point.new(3.14159265, 3.14159265)
]


# Compute the diagram & triangulation
comp = RubyVor::VDDT::Computation.from_points(points)

RubyVor::Visualizer.make_svg(comp, :name => 'tri.svg')
