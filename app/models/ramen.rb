class Ramen < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy

  enum category: { tonkotsu: 0, shoyu: 1, solt: 2, miso: 3, others: 4 }
  enum parking_lot: { exist: 0, noexist: 1 }

end
