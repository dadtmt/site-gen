# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

site = Site.find_or_create_by!(title: "MakeUP")

hero = Hero.find_or_create_by!(site:, name: "home")
Content.find_or_create_by!(page: hero, position: "title", body: "Professional Makeup Artist")
Content.find_or_create_by!(page: hero, position: "tagline", body: "Transform your look with our expert beauty services")
logo  = Content.find_or_create_by!(page: hero, position: "logo", type: "Image")
logo.source.attach(io: File.open("db/seeds/makeup/logo.webp"), filename: "logo.webp") if logo.source.blob.nil?

gallery = Gallery.find_or_create_by!(site:,  name: "gallery")
Content.find_or_create_by!(page: gallery, position: "title", body: "The Gallery")
(1..8).each do |i|
  pic = Content.find_or_create_by!(page: gallery, position: "pic", body: "caption for pic #{i}", type: "Pic")
  pic.source.attach(io: File.open("db/seeds/makeup/gallery/#{i}.jpg"), filename: "#{i}.jpg") if pic.source.blob.nil?
end
