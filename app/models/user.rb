class User < ActiveRecord::Base
  has_secure_password
  has_many :beers
  has_many :comments

  # Loving the validations
  validates :username, :password, :first_name, :last_name, :location, presence: true
  validates :username,  uniqueness: true

  ## Keep your params in line (stylistic)
  validates_length_of :username,
                      minimum: 5,
                      maximum: 15
  validates_length_of :password,
                      :in => 6..20
end

