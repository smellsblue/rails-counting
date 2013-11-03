require "active_record/relation"
require "active_support/concern"
require "active_support/core_ext/module/aliasing"
require "rails-counting/version"

module ActiveRecord
  module Counting
    extend ActiveSupport::Concern

    included do
      alias_method_chain :count, :counting
    end

    def count_with_counting(*args, &block)
      if @counting_values.blank?
        count_without_counting *args, &block
      else
        @counting_values.reduce self do |arel, lambda|
          lambda.call arel
        end.count_without_counting *args, &block
      end
    end

    def counting(&block)
      spawn.counting! &block
    end

    def counting!(&block)
      @counting_values ||= []
      @counting_values << block
      self
    end
  end

  class Relation
    include ::ActiveRecord::Counting
  end
end
