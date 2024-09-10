class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  
  belongs_to :parent, class_name: 'Comment', optional: true
  has_many :replies, class_name: 'Comment', foreign_key: :parent_id, dependent: :destroy

  validate :reply_depth_within_limit
  # validates :comment, presence: true

  def depth
    parent ? parent.depth + 1 : 0
  end
  
  private

  def reply_depth_within_limit
    if parent.present? && parent.depth >= 3
      errors.add(:parent, "can't have more than 3 levels of replies.")
    end
  end

end
