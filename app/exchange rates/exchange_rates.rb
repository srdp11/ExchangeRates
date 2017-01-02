require 'net/http'
require 'json'

class ExchangeRates
  @@uri = URI('https://www.tinkoff.ru/api/v1/currency_rates')
  @json_data
  @rates_data_usd
  @rates_data_eur

  def request_data
    response = Net::HTTP.get(@@uri)
    @json_data = JSON.parse(response)

    @rates_data_eur = @json_data['payload']['rates'].find { |child| child['category'] == 'DepositPayments' &&
                                                                    child['fromCurrency']['name'] == 'EUR' &&
                                                                    child['toCurrency']['name'] == 'RUB'
                                                          }

    @rates_data_usd = @json_data['payload']['rates'].find { |child| child['category'] == 'DepositPayments' &&
                                                                    child['fromCurrency']['name'] == 'USD' &&
                                                                    child['toCurrency']['name'] == 'RUB'
                                                          }
  end

  def get_usd_sell_buy
    [@rates_data_usd['sell'], @rates_data_usd['buy']]
  end

  def get_eur_sell_buy
    [@rates_data_eur['sell'], @rates_data_eur['buy']]
  end

  def get_usd_spread
    [@rates_data_usd['sell'] - @rates_data_usd['buy'],
     (@rates_data_usd['sell'] - @rates_data_usd['buy']) / @rates_data_usd['buy']]
  end

  def get_eur_spread
    [@rates_data_eur['sell'] - @rates_data_eur['buy'],
     (@rates_data_eur['sell'] - @rates_data_eur['buy']) / @rates_data_eur['buy']]
  end
end

