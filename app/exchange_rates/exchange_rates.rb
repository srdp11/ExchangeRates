require 'net/http'
require 'json'

class ExchangeRates
  RATES_URI = URI('https://www.tinkoff.ru/api/v1/currency_rates')

  def fetch_data
    response = Net::HTTP.get(RATES_URI)
    json_data = JSON.parse(response)

    json_data['payload']['rates']
  end

  def from_to(data, from, to)
    data.find do |child| child['category'] == 'DepositPayments' &&
                         child['fromCurrency']['name'] == from &&
                         child['toCurrency']['name'] == to
              end
  end

  def sell_buy(data)
    { sell: data['sell'], buy: data['buy'] }
  end

  def spread(data)
    { absolute:data['sell'] - data['buy'], relative:(data['sell'] - data['buy']) / data['buy'] }
  end
end
