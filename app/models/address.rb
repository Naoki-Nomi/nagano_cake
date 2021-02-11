class Address < ApplicationRecord

  belongs_to :customer, optional: true

  def total_address
    "〒" + self.postal_code + " " + self.address + " "  + self.name
  end

end
