require 'Rate'
require 'pry'

class MainController < ApplicationController
  @@from_to_vals = ['EUR/RUB', 'EUR/USD', 'EUR/GBP',
                    'USD/RUB', 'USD/EUR', 'USD/GBP']

  def index
    from, to = @@from_to_vals[0].scan(/\w+/)

    rates = ExchangeRates.new
    data = rates.from_to(rates.fetch_data, from, to)

    sell_buy_data = rates.sell_buy(data).inject({}) { |h, (k, v)| h[k] = '%.2f' % v; h }
    spread_data = rates.spread(data).inject({}) { |h, (k, v)| h[k] = '%.2f' % v; h }

    # TODO add information about forecast and average rates
    @sell = "#{sell_buy_data[:sell]} #{to}"
    @buy = "#{sell_buy_data[:buy]} #{to}"
    @spread = "#{spread_data[:absolute]} #{to} (#{spread_data[:relative]} %)"
    @fromto = @@from_to_vals
  end
end
