require 'concerns/with_area_codes'

module AreaCodex
  class Country < AreaCodex::Base
    include AreaCodex::WithAreaCodes

    def initialize(country_name)
      super()
      @country_name = normalize(country_name)
      @area_code_list = AreaCodex::AreaCodeList.new(area_code_files)
    end

    private

      def normalize(country_name)
        country_name.to_s.downcase.gsub(' ', '_').to_sym
      end

      def area_code_files
        "#{@country_name}.txt"
      end
  end
end
