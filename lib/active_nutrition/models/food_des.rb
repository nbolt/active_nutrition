# encoding: UTF-8

module ActiveNutrition
  module Models
    class FoodDes < ActiveRecord::Base
      include PgSearch
      pg_search_scope :search, against: :long_desc

      self.table_name = "food_des"
      self.primary_key = :ndb_no

      alias_attribute :description, :long_desc
      alias_attribute :common_name, :comname
      alias_attribute :manufacturer, :manufacname

      has_many :nutrition_facts, :class_name => "ActiveNutrition::Models::NutData", :foreign_key => "ndb_no", :primary_key => "ndb_no"
      has_many :weights, :class_name => "ActiveNutrition::Models::Weight", :foreign_key => "ndb_no", :primary_key => "ndb_no"

      belongs_to :food_group, :class_name => "ActiveNutrition::Models::FdGroup", :foreign_key => "fdgrp_cd", :primary_key => "fdgrp_cd"
    end
  end
end