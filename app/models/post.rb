class Post < ApplicationRecord
	has_one_attached :image

	belongs_to :user

	has_many :comments, as: :commentable
end
