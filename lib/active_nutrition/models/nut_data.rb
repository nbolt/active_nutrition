# encoding: UTF-8

module ActiveNutrition
  module Models
    class NutData < ActiveRecord::Base
      self.table_name = "nut_data"
      self.primary_key = :ndb_no

      alias_attribute :value, :nutr_val

      belongs_to :definition, :class_name => "activenutrition::models::nutrdef", :foreign_key => "nutr_no", :primary_key => "nutr_no"
      validates :ndb_no, :uniqueness => { :scope => [:nutr_no] }
      validates :nutr_no, :uniqueness => { :scope => [:ndb_no] }

      # the value of nutr_val is the number of grams in 100 grams total,
      # which it makes it easy to calculate the amount in every 1 gram
      def amount_per_gram
        return self.nutr_val.to_f / 100.0
      end
    end
  end
end