class Company < ApplicationRecord
  has_many :employee # , dependent: :destroy
  validates :name, :address, presence: true
end
