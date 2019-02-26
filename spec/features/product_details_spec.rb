require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
        )
    end
  end

  scenario "They click on a product title" do
    # ACT
    visit root_path
    first('h4.product-name').click

    # DEBUG / VERIFY
    sleep 2
    save_screenshot 'product_details.jpg'
    expect(page).to have_css 'section.products-show'
  end

  scenario "They click on a product details button" do
    # ACT
    visit root_path
    first('a.pull-right').click

    # DEBUG / VERIFY
    sleep 2
    save_screenshot 'product_details.jpg'
    expect(page).to have_css 'section.products-show'
  end
end
