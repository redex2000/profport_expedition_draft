class Investment < ApplicationRecord
  belongs_to :expedition
  belongs_to :investor
end
