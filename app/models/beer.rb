class Beer < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  validates :name, presence: true, uniqueness: true
  validates :category, :alc_percent, presence: true
end
