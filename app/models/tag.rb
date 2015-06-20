class Tag < ActiveRecord::Base
  has_many :taggings
  has_many :posts, through: :taggings

  # Group & Count the tags
  def self.counts
    self.select("tags.id, tags.name, count(taggings.tag_id) as count").
        joins(:taggings).group("taggings.tag_id, tags.id, tags.name")
  end


end


# generates(for reference)
# SELECT name, count(taggings.tag_id) as count
# FROM "tags" INNER JOIN "taggings" ON "taggings"."tag_id" = "tags"."id"
# GROUP BY taggings.tag_id