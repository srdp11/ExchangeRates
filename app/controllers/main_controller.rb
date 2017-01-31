require 'Rate'
require 'pry'
require 'json'

class MainController < ApplicationController
  def index
    rates = ExchangeRates.new
    data = rates.fetch_format_data

    curr_data = data[ExchangeRates::AVALIBLE_RATES[0]]

    # TODO add information about forecast and average rates
    @data = data
    @fromto = ExchangeRates::AVALIBLE_RATES
  end

  def data
    rates = ExchangeRates.new

    render json: rates.fetch_format_data
  end
end
