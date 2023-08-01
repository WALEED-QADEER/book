class Author < ApplicationRecord
    has_many :books
   
    has_many :books, through: :authorbooks
    
    validates :name, presence: true
  validates :description, presence: true, length: { minimum: 5 }
end
