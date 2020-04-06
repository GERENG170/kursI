class Dop < ApplicationRecord
  belongs_to :coll
  belongs_to :user
  has_many :dopplace


end
