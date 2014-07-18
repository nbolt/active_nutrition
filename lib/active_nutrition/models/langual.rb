# encoding: UTF-8

module ActiveNutrition
  module Models
    class Langual < ActiveRecord::Base
      self.table_name = "langual"
      self.primary_key = :ndb_no

      validates :ndb_no, :uniqueness => { :scope => [:factor_code] }
      validates :factor_code, :uniqueness => { :scope => [:ndb_no] }
    end
  end
end