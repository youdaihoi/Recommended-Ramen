class Ramen < ApplicationRecord

  belongs_to :user
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :shop_name, presence: true
  validates :image, presence: true
  validates :address, presence: true
  validates :category, presence: true
  validates :parking_lot, presence: true
  validates :postal_code, presence: true
  validates :prefecture_code, presence: true
  validates :city, presence: true
  validates :street, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(keyword)
    where(["shop_name like? OR address like?" , "%#{keyword}%", "%#{keyword}%"])
  end

  enum category: { tonkotsu: 0, shoyu: 1, solt: 2, miso: 3, others: 4 }
  enum parking_lot: { exist: 0, noexist: 1 }

  #住所機能
  # include JpPrefecture
  # jp_prefecture :prefecture_code

  # def prefecture_name
  #   JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  # end

  # def prefecture_name=(prefecture_name)
  #   self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  # end
end
