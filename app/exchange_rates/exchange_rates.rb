require 'net/http'
require 'json'

class ExchangeRates
  AVALIBLE_RATES = ['EUR/RUB', 'EUR/USD', 'EUR/GBP',
                    'USD/RUB', 'USD/EUR', 'USD/GBP']
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
    { absolute: data['sell'] - data['buy'], relative: (data['sell'] - data['buy']) / data['buy'] }
  end

  def fetch_format_data
    rates_data = Hash.new

    ExchangeRates::AVALIBLE_RATES.each do |rate|
      from, to = rate.scan(/\w+/)

      rates = ExchangeRates.new
      data = rates.from_to(rates.fetch_data, from, to)

      sell_buy_data = rates.sell_buy(data).inject({}) { |h, (k, v)| h[k] = '%.2f' % v; h }
      spread_data = rates.spread(data).inject({}) { |h, (k, v)| h[k] = '%.2f' % v; h }

      rates_data[rate]  = { sell: "#{sell_buy_data[:sell]} #{to}",
                            buy: "#{sell_buy_data[:buy]} #{to}",
                            spread: "#{spread_data[:absolute]} #{to} (#{spread_data[:relative]} %)" }
    end

    rates_data
  end
end
