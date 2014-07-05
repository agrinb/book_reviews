class Review < ActiveRecord::Base
  validates :description, presence: :true
  belongs_to :books
end
