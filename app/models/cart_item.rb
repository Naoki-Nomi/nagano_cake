class CartItem < ApplicationRecord

  belongs_to :customer, optional: true
  belongs_to :item, optional: true

  validates :amount, :numericality => { :greater_than_or_equal_to => 1 }

  def tax_price
    (self.item.price * 1.08).round(0).to_s(:delimited, delimiter: ',')
  end

  def total_price
    (self.item.price * self.amount * 1.08).round(0).to_s(:delimited, delimiter: ',')
  end

  def for_check_price
    (self.item.price * self.amount * 1.08).round(0)
  end

end