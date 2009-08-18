require 'markup_validity'

class ScansController < ApplicationController
  def new
    require 'open-uri'
    url = 'http://new.teabass.com'
    @page = Hpricot(open(url))
    
    @scan = MarkupValidity::Validator.new @page.to_s, MarkupValidity::Validator::XHTML1_TRANSITIONAL
    
    # tidy_scan(@page.to_s)
  end
  
  private
  
  def tidy_scan(html)
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

      @cleaned = tidy.clean(html)
      @errors = tidy.errors.first.to_s.split("\n")
      @diagnostics = tidy.diagnostics.first.to_s.split("\n")
    end
  end
end

