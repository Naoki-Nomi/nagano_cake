class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: { impossible: 0, waiting: 1, making: 2, complete: 3 }

  def order_price
    self.price.to_s(:delimited, delimiter: ',')
  end

  def order_unit_price
    (self.price / self.amount).round(0).to_s(:delimited, delimiter: ',')
  end

end
