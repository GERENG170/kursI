class Tag < ActiveRecord::Base
    has_many :taggings, dependent: :destroy
    has_many :items, through: :taggings
    def self.counts
        self.select("name, count(taggings.tag_id) as count").joins(:taggings).group("name, taggings.tag_id")
        end
end
