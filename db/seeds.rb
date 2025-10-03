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

# Create default shipping category if missing
shipping_category = Spree::ShippingCategory.first || Spree::ShippingCategory.create!(name: "Default")

# Create a default taxon (category)
taxonomy = Spree::Taxonomy.first || Spree::Taxonomy.create!(name: "Categories")
taxon = taxonomy.root.children.create!(name: "Test Category") if taxonomy.root.children.empty?

# Create 10 products
10.times do |i|
  product = Spree::Product.create!(
    name: "Test Product #{i+1}",
    price: 10 + i,
    available_on: Time.current,
    shipping_category: shipping_category
  )
  # Assign to category
  product.taxons << taxon
  product.save!
end


