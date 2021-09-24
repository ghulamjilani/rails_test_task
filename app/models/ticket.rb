class Ticket < ApplicationRecord
  has_many :excavators
  accepts_nested_attributes_for :excavators
end
