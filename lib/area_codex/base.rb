module AreaCodex
  class Base

    def initialize
      @area_code_list = AreaCodeList.new(area_code_files)
    end

    def area_code_files
      raise 'Subclasses must define this method.'
    end

  end
end
