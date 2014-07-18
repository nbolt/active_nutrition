# encoding: UTF-8

module ActiveNutrition
  module Models
    class Weight < ActiveRecord::Base
      self.table_name = "weight"
      self.primary_key = :ndb_no

      validates :ndb_no, :uniqueness => { :scope => [:seq] }
      validates :seq, :uniqueness => { :scope => [:ndb_no] }

      alias_attribute :amount, :amount
      alias_attribute :grams, :gm_wgt
      alias_attribute :measurement, :msre_desc
    end
  end
end