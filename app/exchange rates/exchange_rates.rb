require 'net/http'
require 'json'

class ExchangeRates
  @@uri = URI('https://www.tinkoff.ru/api/v1/currency_rates')
  @json_data

  def request_data
    response = Net::HTTP.get(@@uri)
    @json_data = JSON.parse(response)
  end

  def get_usd
    @json_data['payload']['rates'][0]['buy']
  end

  def get_eur
    @json_data['payload']['rates'][1]['buy']
  end

  def get_spread(currency)
    rates_data = @json_data['payload']['rates'].find { |child| child['category'] == 'DepositPayments' &&
                                                               child['fromCurrency']['name'] == currency &&
                                                               child['toCurrency']['name'] == 'RUB'
                                                     }

    [rates_data['sell'] - rates_data['buy'],
     (rates_data['sell'] - rates_data['buy']) / rates_data['buy']]
  end
end
