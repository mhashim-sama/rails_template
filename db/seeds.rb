require 'faker'

10.times do
  Product.create!(
      name: Faker::Commerce.product_name,
      description: Faker::Lorem.sentence,
      price: rand(10..100)
  )
end