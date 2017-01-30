require 'net/smtp'

class FetchDataWorker
  include Sidekiq::Worker

  def rates_fetching(from, to)
    rates = ExchangeRates.new
    data = rates.sell_buy(rates.from_to(rates.fetch_data, from, to))

    data = Rate.create(from: from,
                       to: to,
                       sell: data[:sell],
                       buy: data[:buy])
  end

  # def email_notification
  #   exch_rates = ExchangeRates.new
  #   data = exch_rates.fetch_data
  #
  #   Client.find_each do |client|
  #     from, to = client.fromto.scan(/\w+/)
  #     operation_data = exch_rates.sell_buy(exch_rates.fromto(data, from, to))[:client.operation.to_s];
  #
  #     delta = client.threshold - operation_data;
  #
  #     if (client.condition == "greater" and delta > 0) or
  #        (client.condition == "lesser" and delta < 0)
  #        # TODO replace this condition with error threshold equals 0.01
  #        if client.last_notification_value - operation_data > 0.01
  #          send_email("Notification about rates!", client.email)
  #        end
  #     end
  #   end
  # end

  def perform
    ExchangeRates::AVALIBLE_RATES.each do |from_to|
      from, to = from_to.scan(/\w+/)
      rates_fetching(from, to)
    end
  end
end
