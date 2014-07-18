# encoding: UTF-8

module ActiveNutrition
  module Objects
    class NutritionFact < Base
      METHOD_MAP = { :nutrition_number => :nutr_no,
                     :value => :nutr_val,
                     :num_data_points => :num_data_pts,
                     :standard_error => :std_error,
                     :units => :units,
                     :description => :nutrdesc,
                     :tag_name => :tagname,
                     :sr_order => :sr_order }

      METHOD_MAP.each_pair do |method, attr_name|
        define_method(method) { self.attributes[attr_name.to_s] }
      end

      def attributes
        @attributes ||= base_model.attributes.merge(base_model.definition.attributes)
      end
    end
  end
end
