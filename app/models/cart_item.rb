class CartItem < ApplicationRecord

  belongs_to :customer, optional: true
  belongs_to :item, optional: true

  def tax_price
    (item.price * 1.08).round(0).to_s(:delimited, delimiter: ',')
  end

  def total_price
    (item.price * amount * 1.08).round(0).to_s(:delimited, delimiter: ',')
  end

  def for_check_price
    (item.price * amount * 1.08).round(0)
  end

end