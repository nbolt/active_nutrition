# encoding: UTF-8

module ActiveNutrition
  module Objects
    class Weight < Base
      METHOD_MAP = { :amount => :amount,
                     :grams => :gm_wgt,
                     :measurement => :msre_desc }

      METHOD_MAP.each_pair do |method, attr_name|
        define_method(method) { self.attributes[attr_name.to_s] }
      end
    end
  end
end