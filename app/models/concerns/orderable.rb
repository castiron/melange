module Orderable
  extend ActiveSupport::Concern

  module ClassMethods

    def ordered(order_by, order_asc = 1)
      if !@valid_orderings
        Rails.logger.warn "The #{name} model mixes in the Orderable concern."
        Rails.logger.warn "However, it does not implement @valid_orderings as a class instance variable. Orderable is falling back to created_at as the only orderable property."
        valid_orderings = [:created_at]
      else
        valid_orderings = @valid_orderings
      end
      if order_by
        property = valid_orderings.find {|i| i.to_s == order_by} || valid_orderings.first
      else
        property = valid_orderings.first
      end
      asc_or_desc = order_asc.to_i == 1 ? :asc : :desc
      order(property.to_sym => asc_or_desc)
    end


  end
end