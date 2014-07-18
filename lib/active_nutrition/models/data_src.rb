# encoding: UTF-8

module ActiveNutrition
  module Models
    class DataSrc < ActiveRecord::Base
      self.table_name = "data_src"
      self.primary_key = :datasrc_id
    end
  end
end