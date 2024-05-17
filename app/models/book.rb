class Book < ApplicationRecord
  
  # bookから見るユーザーは一人
  belongs_to :user
  
end
