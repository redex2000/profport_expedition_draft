class Paragraph < ApplicationRecord
  belongs_to :book, -> { includes :author  }

end
