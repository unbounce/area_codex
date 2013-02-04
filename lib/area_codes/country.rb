module AreaCodes
  class Country
    extend Forwardable

    def initialize(country_name)
      @country_name = normalize(country_name)
      @area_code_list = AreaCodeList.new(area_code_file)
    end

    def_delegator :@area_code_list, :include?, :include?
    def_delegator :@area_code_list, :exclude?, :exclude?
    def_delegator :@area_code_list, :area_codes, :area_codes

    private

      def normalize(country_name)
        country_name.downcase.gsub(' ', '_').to_sym
      end

      def area_code_file
        "#{@country_name}.txt"
      end
  end
end
