class Rate < ApplicationRecord
  def initialize(attributes = {})
    super
    @usd_sell = attributes[:usd_sell]
    @usd_buy = attributes[:usd_buy]
    @eur_sell = attributes[:eur_sell]
    @eur_buy = attributes[:eur_buy]
  end
end
