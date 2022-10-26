# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

image = File.open("#{Rails.root}/db/seed_images/media-icon.png")

ActiveRecord::Base.transaction do
  10.times do
    post = Post.new(title: Faker::Book.title, content: Faker::GreekPhilosophers.quote)
    post.image.attach(io: image, filename: "#{post.title}-image.png", content_type: 'image/png')
    post.save!
    image.rewind
  end
end
image.close

ActiveRecord::Base.transaction do
  5.times do
    Navbar.create!(label: Faker::Commerce.department, url: Faker::Internet.url)
  end
end

ActiveRecord::Base.transaction do
  7.times do|n|
    product = Product.new(title: Faker::Commerce.product_name, description: Faker::Commerce.price)

    image = File.open("#{Rails.root}/db/seed_images/product-#{n + 1}.webp")
    product.image.attach(io: image, filename: "product-#{n + 1}.webp")
    product.save!

    image.close
  end
end