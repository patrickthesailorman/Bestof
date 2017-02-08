class Post < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  validates :title, presence: true
  validates :content, presence: true
  validates :user_id, presence: true
  acts_as_votable
  def votes
    self.get_upvotes.size - self.get_downvotes.size
  end
end
