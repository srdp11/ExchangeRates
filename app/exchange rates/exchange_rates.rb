require 'net/http'
require 'json'

class ExchangeRates
  @@uri = URI('https://www.tinkoff.ru/api/v1/currency_rates')

  def fetch_data(currency)
    response = Net::HTTP.get(@@uri)
    json_data = JSON.parse(response)

    rates_data = json_data['payload']['rates'].find { |child| child['category'] == 'DepositPayments' &&
                                                              child['fromCurrency']['name'] == currency &&
                                                              child['toCurrency']['name'] == 'RUB'
                                                    }
  end

  def get_sell_buy(rates_data)
    [rates_data['sell'], rates_data['buy']]
  end

  def get_spread(rates_data)
    [rates_data['sell'] - rates_data['buy'],
     (rates_data['sell'] - rates_data['buy']) / rates_data['buy']]
  end
end

