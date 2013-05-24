# encoding: UTF-8
#
# hungarian-airspaces
#
# Author::    Peter Kepes  (https://github.com/kepes)
# Github:: https://github.com/kepes/hungarian-airspaces
#
# This script converts gpx files to fa5 format for FlyChart program.
# Flychart download link: http://www.brauniger.com/en/support/downloads/flight-analysis-software.html
#

require 'nokogiri'

filename = ARGV[0]
doc = Nokogiri::HTML(open("#{filename}.gpx"))


builder = Nokogiri::XML::Builder.new do |xml|
  xml.DATA {
    doc.search('trk').each_with_index do |trk, trk_idx| 
      descr = trk.search('desc').first
      name = trk.search('name').first
      
      if name.nil? && descr.nil?
        name = trk_idx
        descr = ''
      elsif !name.nil? && descr.nil?
        descr = name.content
        name = name.content
      elsif name.nil? && !descr.nil?
        name = descr.content
        descr = ''
      else
        name = name.content
        descr = descr.content
      end
      
      xml.airspace( :name => name, :descr => descr, :warndist => "2000" ) {
        trk.search('trkpt').each_with_index do |trkpt, trkpt_idx|
          xml.point( :id => trkpt_idx + 1, :longitude => trkpt[:lon], :latitude => trkpt[:lat] )
        end
      }
    end
  }
end

File.open("#{filename}.fa5", 'w') {|f| f.write(builder.to_xml) }