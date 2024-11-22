class Page < ApplicationRecord
  belongs_to :site

  has_many :contents, dependent: :destroy

  validates :name, presence: true, uniqueness: { scope: :site_id }
  validates :anchor, uniqueness: { scope: :site_id }

  before_save :slugify, if: :will_save_change_to_name?

  def get_content(position)
   indexed_contents[position] || Content.new(body: "")
  end

  def to_partial_path = "pages/#{ type ? type.downcase : 'page'}"

  private

  def indexed_contents
    @idx_contents ||=  contents.index_by(&:position)
  end

  def slugify
    self.anchor = name.parameterize
  end
end
