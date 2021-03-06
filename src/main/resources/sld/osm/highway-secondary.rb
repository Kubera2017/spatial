#!/usr/bin/env ruby

# This script uses the amanzi-sld DSL to create a sample SLD file
# for styling a number of layers in a typical OSM data model.
# This example should work with a layer containing all geometries.

require 'amanzi/sld'

Amanzi::SLD::Config.config[:geometry_property] = 'the_geom'
#Amanzi::SLD::Config.config[:verbose] = true

sld = Amanzi::SLD::Document.new "Example Neo4j Spatial OSM Style"

sld.comment "A style for secondary highways"
sld.
  add_line_symbolizer(:stroke => '#909090', :stroke_width => 5).
  add_line_symbolizer(:stroke => '#b0b0ff', :stroke_width => 3) do |f|
  f.op(:and) do |f|
    f.geometry = 'LineString'
    f.property.exists? 'highway'
    f.property['highway'] = 'secondary'
  end
end
sld

