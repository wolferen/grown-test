class Tablet < ApplicationRecord
  has_many :sensors
  belongs_to :user
end
