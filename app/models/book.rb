class Book < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { scope: :author }
  validates :author, :year, presence: true
  has_many :reviews
  accepts_nested_attributes_for :reviews
end
