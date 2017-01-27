class Rate < ApplicationRecord
  def initialize(attributes = {})
    super
    @from = attributes[:from]
    @to = attributes[:to]
    @sell = attributes[:sell]
    @buy = attributes[:buy]
  end
end
