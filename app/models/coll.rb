class Coll < ApplicationRecord
    acts_as_votable
    has_many :dops ,dependent: :destroy
    has_many :items, dependent: :destroy
    belongs_to :user
    has_many :dop
    validates_length_of :title, maximum: 30, allow_blank: true
    validates_length_of :body, minimum: 10, allow_blank: true
    validates  :title, presence: true
    validates  :image, presence: true
    validates  :body, presence: true
    has_one_attached :image

    has_many :topiccing , dependent: :destroy
    has_many :topic , through: :topiccing
   def all_topics=(names)
    self.topic = names.split(',').map do |name|
      Topic.where(name: name).first_or_create!
  end
end
def all_topics
  topic.map(&:name).join(",")
end

def self.search(search)
  if search
    self.where("title like ?", "%#{search}%")
  else
    self.all
  end
end
end

