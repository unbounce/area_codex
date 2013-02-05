module AreaCodex
  class Country < Base
    include WithAreaCodes

    def initialize(name)
      @name = normalize(name)
      super()
    end

    private

      def normalize(country_name)
        country_name.to_s.downcase.gsub(' ', '_').to_sym
      end

      def area_code_files
        "#{@name}.txt"
      end
  end
end
