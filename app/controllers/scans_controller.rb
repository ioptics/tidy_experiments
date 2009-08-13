class ScansController < ApplicationController
  def new
    require 'open-uri'
    url = 'http://www.toyota.co.uk'
    @page = Hpricot(open(url))
    
    options = {
      :show_warnings => false, 
      :show_errors => 6, 
      :indent => true, 
      :indent_spaces => 4,
      :indent_attributes => false,
      :write_back => true,
      :output_xml => true,
      :input_xml => true,
      :wrap_sections => false,
      :accessibility_check => 3,
      :wrap => 200,
      :clean => false,
      :markup => false
    }

    Tidy.open(options) do |tidy|
      tidy.options.output_xml = true

      @cleaned = tidy.clean(@page.to_s)
      @errors = tidy.errors.first.to_s.split("\n")
      @diagnostics = tidy.diagnostics.first.to_s.split("\n")
    end
  end
end

