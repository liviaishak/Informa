class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations

  validates :user, presence: true
  scope :pubic, -> { where(private: false) }
end
