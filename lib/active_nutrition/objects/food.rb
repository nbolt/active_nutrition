# encoding: UTF-8

module ActiveNutrition
  module Objects
    class Food < Base
      METHOD_MAP = { :name => :long_desc,
                     :ndb_number => :ndb_no,
                     :common_name => :comname,
                     :manufacturers_name => :manufacname,
                     :survey => :survey,
                     :scientific_name => :sciname,
                     :fat_factor => :fat_factor,
                     :protein_factor => :pro_factor }

      METHOD_MAP.each_pair do |method, attr_name|
        define_method(method) { attributes[attr_name.to_s] }
      end

      attr_reader :food_group, :nutrition_facts

      def food_group
        @food_group ||= FoodGroup.new(base_model.food_group)
      end

      def nutrition_facts
        @nutrition_facts ||= NutritionFacts.new(NutritionFact.wrap(base_model.nutrition_facts))
      end

      def weights
        @weights ||= Weights.new(Weight.wrap(base_model.weights))
      end

      def factors
        [:fat_factor, :protein_factor].inject({}) do |ret, factor|
          ret[factor] = attributes[METHOD_MAP[factor].to_s]
          ret
        end
      end
    end
  end
end
