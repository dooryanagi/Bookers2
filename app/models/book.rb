class Book < ApplicationRecord

  # bookから見るユーザーは一人
  belongs_to :user

  # バリデーションの設定
  validates :title, presence: true
  validates :opinion, presence: true
  validates :opinion, length: {maximum: 200}

end
