# encoding: UTF-8

module ActiveNutrition
  module Models
    class Footnote < ActiveRecord::Base
      self.table_name = "footnote"
      self.primary_key = :footnt_no
    end
  end
end