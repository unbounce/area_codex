require 'set'

module AreaCodex
  class AreaCodeList
    attr_reader :area_codes

    def initialize(*area_code_files)
      @area_codes = Set.new
      load_area_codes(area_code_files.flatten)
    end

    def include?(area_code)
      @area_codes.include?(area_code.to_i)
    end

    def exclude?(area_code)
      !include?(area_code)
    end

    private

      def load_area_codes(area_code_files)
        area_code_files.each do |file_name|
          file_path = File.expand_path("../../data/#{file_name}", __FILE__)

          if File.exists?( file_path )
            File.open( file_path ) do |file|
              @area_codes.merge( Set.new( file.readlines.map { |code| code.chop.to_i } ) )
            end
          end
        end
      end
  end
end
