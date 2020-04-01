class Topic < ApplicationRecord
    has_many :topiccing, dependent: :destroy
    has_many :colls, through: :topiccing
end
