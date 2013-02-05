module AreaCodex
  class Country < Base
    require 'forwardable'
    extend Forwardable

    def initialize(name)
      @name = normalize(name)
      super()

      puts ">> HEY"
    end

    def_delegator :@area_code_list, :include?, :include?
    def_delegator :@area_code_list, :exclude?, :exclude?
    def_delegator :@area_code_list, :area_codes, :area_codes

    private

      def normalize(country_name)
        country_name.to_s.downcase.gsub(' ', '_').to_sym
      end

      def area_code_files
        "#{@name}.txt"
      end
  end
end
