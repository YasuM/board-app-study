class BoardComment < ApplicationRecord
  belongs_to :board
  validates :comment, presence: true

end
