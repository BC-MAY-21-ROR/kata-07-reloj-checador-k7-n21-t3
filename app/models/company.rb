class Company < ApplicationRecord
  has_many :employee # , dependent: :destroy
  validate :name, :address, presence: true
end
