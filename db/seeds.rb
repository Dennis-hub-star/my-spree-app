# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Spree::Core::Engine.load_seed if defined?(Spree::Core)

# Minimal product seed for free Render instance
10.times do |i|
  Spree::Product.create!(
    name: "Test Product #{i+1}",
    price: (10 + i),          # price from 10 to 19
    available_on: Time.current,
    shipping_category: Spree::ShippingCategory.first || Spree::ShippingCategory.create!(name: "Default")
  )
end

