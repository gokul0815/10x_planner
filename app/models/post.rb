class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy

  # Pagination
  self.per_page = 7
end
