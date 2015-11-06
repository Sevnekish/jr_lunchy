class FirstOrderForTodayValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.today_orders.empty?
      record.errors[attribute] << (options[:message] || "You can make order only once a day!")
    end
  end
end