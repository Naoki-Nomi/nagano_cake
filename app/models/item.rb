class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_items
  belongs_to :genre

  attachment :image

  enum is_active: {販売中: true, 販売停止中: false}

  def self.search(search)
    search ? where('genre_id LIKE ?', "%#{search}%") : all
  end

end
