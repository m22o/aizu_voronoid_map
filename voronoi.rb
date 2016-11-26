require 'ruby_vor'
require 'pp'
require 'pry'
require 'json'
json_file_path = 'data.json'
MAX_NUM = 5000

json_data = open(json_file_path) do |io|
  JSON.load(io)
end

points = []
json_data.each do |place|
  points.push(RubyVor::Point.new(place["latitude"]*MAX_NUM, place["longitude"]*MAX_NUM))
end


# RubyVor::Visualizer.make_svg(comp, :name => 'tri.svg')

# Compute the diagram & triangulation
# binding.pry
comp = RubyVor::VDDT::Computation.from_points(points)
# pp comp.nn_graph
# pp comp.minimum_spanning_tree

RubyVor::Visualizer.make_svg(comp, :name => 'dia.svg', :voronoi_diagram => true)

RubyVor::Visualizer.make_svg(comp, :name => 'tri.svg')
