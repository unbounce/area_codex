module AreaCodex
  class Region
    extend Forwardable

    NORTH_AMERICA = [:canada, :mexico, :united_states]

    def initialize(region_name)
      @region_name = constantize(region_name)
      @area_code_list = AreaCodex::AreaCodeList.new(area_code_files)
    end

    def_delegator :@area_code_list, :include?, :include?
    def_delegator :@area_code_list, :exclude?, :exclude?
    def_delegator :@area_code_list, :area_codes, :area_codes

    private

      def constantize(region_name)
        name = region_name.upcase.gsub(' ', '_')
        klass = self.class
        klass.const_defined?(name) ? klass.const_get(name) : klass.const_missing(name)
      end

      def area_code_files
        @region_name.map { |sym| "#{sym}.txt" }
      end
  end
end
