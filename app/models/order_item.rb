class OrderItem < ApplicationRecord

  belongs_to :order
  belongs_to :item

  enum making_status: { 製作不可: 0, 製作待ち: 1, 製作中: 2, 製作完了: 3 }

  def order_price
    self.price.to_s(:delimited, delimiter: ',')
  end

  def order_unit_price
    (self.price / self.amount).round(0).to_s(:delimited, delimiter: ',')
  end

end
