class Board < ApplicationRecord
    has_one_attached :avatar
    validates :title, presence: true
    validates :body, presence: true
end
