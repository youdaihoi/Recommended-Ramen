class Ramen < ApplicationRecord

  belongs_to :user
  belongs_to :category
  attachment :image
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :shop_name, presence: true
  validates :image, presence: true
  validates :category_id, presence: true
  validates :parking_lot, presence: true
  validates :postal_code, presence: true
  validates :prefecture_code, presence: true
  validates :city, presence: true
  validates :street, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  enum parking_lot: { exist: 0, noexist: 1 }

  #住所機能
   include JpPrefecture
   jp_prefecture :prefecture_code


   def self.search(keyword)
    where(["shop_name like? OR city like?" , "%#{keyword}%", "%#{keyword}%"])
   end
end
