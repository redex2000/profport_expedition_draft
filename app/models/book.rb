class Book < ApplicationRecord
  has_many :paragraphs
  belongs_to :author, -> { readonly }, foreign_key: 'author_id', class_name: 'Author'

  validates :title, presence: true
end
