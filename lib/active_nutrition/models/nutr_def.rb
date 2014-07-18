# encoding: UTF-8

module ActiveNutrition
  module Models
    class NutrDef < ActiveRecord::Base
      self.table_name = "nutr_def"
      self.primary_key = :nutr_no

      alias_attribute :units, :units
      alias_attribute :name, :nutrdesc
      alias_attribute :tag_name, :tagname
    end
  end
end