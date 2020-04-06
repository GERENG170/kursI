class Item < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :coll
  has_many :dopplaces
  has_many :taggings , dependent: :destroy
  has_many :tags , through: :taggings
  has_one_attached :image
  validates  :image, presence: true


  def all_tags
    self.tags.map(&:name).join(', ')
    end
    
    def all_tags=(names)
    self.tags = names.split(',').map do |name|
    Tag.where(name: name.strip).first_or_create!
    end
    end
  end
