class OrderItemsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    begin
      raise 'Items must be from today\'s menu!' unless contains_in_today_menu?(value)
      raise 'Order must contain one item for each category!' unless for_each_category?(value)
      raise 'Order can contain only one item for each category!' unless only_one_per_category?(value)
    rescue Exception => e
      record.errors[attribute] << (options[:message] || e.message)
    end
  end

  private
    def contains_in_today_menu?(value)
      menu_item_ids  = DayMenu.actual(DateTime.now).items.map { |item| item.id }
      order_item_ids = value.map { |item| item.id }
      order_item_ids == (menu_item_ids & order_item_ids)
    end

    def for_each_category?(value)
      menu_category_ids  = DayMenu.actual(DateTime.now).items.map { |item| item.category.id }
      item_category_ids = value.map { |item| item.category.id }
      menu_category_ids.uniq == item_category_ids.uniq
    end

    def only_one_per_category?(value)
      category_ids = value.map { |item| item.category.id }
      category_ids == category_ids.uniq
    end
end