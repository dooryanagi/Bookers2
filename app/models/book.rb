class Book < ApplicationRecord

  # bookから見るユーザーは一人
  belongs_to :user

  # バリデーションの設定
  validates :title, presence: true
  validates :body, presence: true
  validates :body, length: {maximum: 200}

end
