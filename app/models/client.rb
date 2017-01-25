class Client < ApplicationRecord
  def initialize(attributes = {})
    super
    @email = attributes[:email]
    @fromto = attributes[:fromto]
    @condition = attributes[:condition]
    @threshold = attributes[:threshold]
    @last_notification_value = nil
  end

  def last_notification_value=(value)
    self[:last_notification_value] = value
  end
end
