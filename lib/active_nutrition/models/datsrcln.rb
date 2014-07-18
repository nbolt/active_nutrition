# encoding: UTF-8

module ActiveNutrition
  module Models
    class Datsrcln < ActiveRecord::Base
      self.table_name = "datsrcln"
      self.primary_key = :ndb_no

      validates :ndb_no, :uniqueness => { :scope => [:nutr_no, :datasrc_id] }
      validates :dutr_no, :uniqueness => { :scope => [:ndb_no, :datasrc_id] }
      validates :datasrc_id, :uniqueness => { :scope => [:ndb_no, :nutr_no] }
    end
  end
end