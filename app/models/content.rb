class Content  < ApplicationRecord
    belongs_to :page

    def to_partial_path = "contents/#{ type ? type.downcase : 'content'}"
end
