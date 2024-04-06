class Cat < ApplicationRecord
  #has_ancestry
  validates :name, presence: true, uniqueness: true
  has_many :posts
end
