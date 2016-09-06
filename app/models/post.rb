class Post < ApplicationRecord
  belongs_to :user, dependent: :destroy
  paginates_per 7
end
