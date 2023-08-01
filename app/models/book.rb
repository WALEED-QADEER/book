class Book < ApplicationRecord
 
  has_many :authorbooks
  has_many :authors, through: :authorbooks
 

  accepts_nested_attributes_for :authors, allow_destroy: true
  
  validates :title, presence: true, uniqueness: { scope: :title }
  validates :content, presence: true, length: { minimum: 5 }
end
