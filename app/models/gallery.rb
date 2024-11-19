class Gallery < Page
    def pics
        contents.select { |content| content.position=="pic" }
    end
end
