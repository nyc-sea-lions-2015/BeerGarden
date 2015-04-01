class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer

  validates :content, presence: true
  validates_length_of :content, :maximum => 500
end
