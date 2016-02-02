class Post < ActiveRecord::Base
  # has_many :post_tags
  # has_many :tags, through: :post_tags

  belongs_to :user

  acts_as_taggable_on :tags
  # acts_as_taggable

  validates :title, presence: true, allow_blank: false
  validates :body, presence: true, allow_blank: false
  validates :slug, uniqueness: true

  before_validation do
    self.slug = self.title.parameterize
  end
end
