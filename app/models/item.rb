class Item < ActiveRecord::Base
  has_many :comments
  belongs_to :coll
  has_many :taggings , dependent: :destroy
  has_many :tags , through: :taggings
  validates_length_of :title, minimum: 5,  allow_blank: true
  validates_length_of :body, minimum: 20,  allow_blank: true
  has_one_attached :image

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name).first_or_create!
  end
end
def all_tags
  tags.map(&:name).join(",")
end
end
