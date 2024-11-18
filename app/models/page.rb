class Page < ApplicationRecord
  belongs_to :site

  validates :name, presence: true, uniqueness: { scope: :site_id }
  validates :anchor, uniqueness: { scope: :site_id }

  before_save :slugify, if: :will_save_change_to_name?

  private

  def slugify
    self.anchor = name.parameterize
  end
end
