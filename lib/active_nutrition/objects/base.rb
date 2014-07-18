# encoding: UTF-8

module ActiveNutrition
  module Objects
    class Base < ActiveRecord::Base
      attr_reader :attributes, :base_model

      def initialize(base_model)
        @base_model = base_model
      end

      def attributes
        base_model.attributes
      end

      def self.wrap(obj)
        if obj.respond_to? :map
          obj.map { |o| new(o) }
        else
          new(obj)
        end
      end
    end
  end
end
