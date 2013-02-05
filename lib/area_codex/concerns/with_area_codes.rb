module AreaCodex
  module WithAreaCodes
    extend Forwardable

    def_delegator :@area_code_list, :include?, :include?
    def_delegator :@area_code_list, :exclude?, :exclude?
    def_delegator :@area_code_list, :area_codes, :area_codes
  end
end
