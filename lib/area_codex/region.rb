module AreaCodex
  class Region < Base
    require 'forwardable'
    extend Forwardable

    NORTH_AMERICA = [:canada, :mexico, :united_states]

    def initialize(name)
      @name = constantize(name)
      super()
    end

    def_delegator :@area_code_list, :include?, :include?
    def_delegator :@area_code_list, :exclude?, :exclude?
    def_delegator :@area_code_list, :area_codes, :area_codes

    private

      def constantize(region_name)
        name = region_name.to_s.upcase.gsub(' ', '_')
        klass = self.class
        klass.const_defined?(name) ? klass.const_get(name) : klass.const_missing(name)
      end

      def area_code_files
        @name.map { |sym| "#{sym}.txt" }
      end
  end
end
