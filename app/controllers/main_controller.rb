require 'Rate'
require 'pry'

class MainController < ApplicationController
  @@from_to_vals = ['EUR/RUB', 'EUR/USD', 'EUR/GBR',
                    'USD/RUB', 'USD/EUR', 'USD/GBR',
                    'GBR/RUB', 'GBR/USD', 'GBR/EUR']

  def index
    # TODO change 'eur' => 'RUB' to default page selecting for rates
    from, to = @@from_to_vals[0].scan(/\w+/)

    rates = ExchangeRates.new
    data = rates.from_to(rates.fetch_data, from, to)

    sell_buy_data = rates.sell_buy(data)
    spread_data = rates.spread(data).inject({}) { |h, (k, v)| h[k] = '%.2f' % v; h }
    puts spread_data

    @sell = "#{sell_buy_data[:sell]} #{to}"
    @buy = "#{sell_buy_data[:buy]} #{to}"
    @spread = "#{spread_data[:absolute]} #{to} (#{spread_data[:relative]} %)"
    @fromto = @@from_to_vals
  end
end
