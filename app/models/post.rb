class Post < ActiveRecord::Base
  has_many :taggings
  has_many :tags, through: :taggings

  # Getter and setter virtual attributes for all_tags

  # convert our tags into an array and then use map to strip each and write to Tag table.
  def all_tags=(names)
     self.tags = names.split(",").map do |name|
       Tag.where(name: name.strip).first_or_create
     end
  end

  # get out tags array and format a string delimited by commas
  def all_tags
    self.tags.map(&:name).join(",")
  end

  def self.tagged_with(name)
    Tag.find_by_name!(name).posts
  end

end

