class Gallery < Page
    def pics
        # change the select to where (maybe?)
        contents.select { |content| content.position=="pic" }
    end
end
