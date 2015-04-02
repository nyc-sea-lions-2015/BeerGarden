class Beer < ActiveRecord::Base
  belongs_to :user
  has_many :comments

  # Nice to have validation in the models!!
  validates :name,     presence: true, uniqueness: true
  validates :category, :alc_percent, presence: true

  def self.all_by_category_and_name
    all.order(:category, :name)
  end
end
