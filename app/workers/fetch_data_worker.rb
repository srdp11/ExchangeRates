require 'net/smtp'
require 'mailfactory'
require 'pry'

class FetchDataWorker
  include Sidekiq::Worker

  def rates_fetching
    rates = ExchangeRates.new
    data_eur = rates.from_to(rates.fetch_data, 'EUR', 'RUB')
    data_usd = rates.from_to(rates.fetch_data, 'USD', 'RUB')

    data = Rate.create(usd_sell: rates.sell_buy(data_usd)[0],
                       usd_buy: rates.sell_buy(data_usd)[1],
                       eur_sell: rates.sell_buy(data_eur)[0],
                       eur_buy: rates.sell_buy(data_eur)[1])
  end

  def email_notification
    exch_rates = ExchangeRates.new
    data = exch_rates.fetch_data

    Client.find_each do |client|
      from, to = client.fromto.scan(/\w+/)
      operation_data = exch_rates.sell_buy(exch_rates.fromto(data, from, to))[:client.operation.to_s];

      delta = client.threshold - operation_data;

      if (client.condition == "greater" and delta > 0) or
         (client.condition == "lesser" and delta < 0)
         # TODO replace this condition with error threshold equals 0.01
         if client.last_notification_value - operation_data > 0.01
           send_email("Notification about rates!", client.email)
         end
      end
    end
  end

  def perform
    rates_fetching
    email_notification
  end
end
