# encoding: UTF-8

module ActiveNutrition
  module Models
    class Langdesc < ActiveRecord::Base
      self.table_name = "langdesc"
      self.primary_key = :factor_code
    end
  end
end