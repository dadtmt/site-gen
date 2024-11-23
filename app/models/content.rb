class Content  < ApplicationRecord
    belongs_to :page
    has_one_attached :source

    def to_partial_path = "contents/#{ type ? type.downcase : 'content'}"
end
