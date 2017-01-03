require 'Rate'
require 'pry'

class MainController < ApplicationController
  def index
    rates = ExchangeRates.new
    data_eur = rates.fetch_data('EUR')
    data_usd = rates.fetch_data('USD')

    data = Rate.create(usd_sell: rates.get_sell_buy(data_usd)[0],
                       usd_buy: rates.get_sell_buy(data_usd)[1],
                       eur_sell: rates.get_sell_buy(data_eur)[0],
                       eur_buy: rates.get_sell_buy(data_eur)[1])

  end
end
