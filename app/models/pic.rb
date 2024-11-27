class Pic < Content
    # Pic might not be a content but belongs to a gallery
    # low fi thumb could be a content of type Image
    # Gallery would be in charge of managing the sync between them
    # how to manage the active storage relation

    has_one_attached :source do |attachable|
        attachable.variant :small, resize_to_limit: [ 25, 25 ], preprocessed: true
        attachable.variant :medium, resize_to_limit: [ 300, 300 ], preprocessed: true
        attachable.variant :big, resize_to_limit: [ 700, 700 ], preprocessed: true
    end
end
