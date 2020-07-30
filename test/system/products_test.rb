require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "creating a Product" do
    visit products_url
    click_on "New Product"

    check "Delete flag" if @product.delete_flag
    fill_in "Genre", with: @product.genre_id
    fill_in "Image", with: @product.image_id
    fill_in "Introduce", with: @product.introduce
    fill_in "Name", with: @product.name
    fill_in "Price", with: @product.price
    check "Product status" if @product.product_status
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "updating a Product" do
    visit products_url
    click_on "Edit", match: :first

    check "Delete flag" if @product.delete_flag
    fill_in "Genre", with: @product.genre_id
    fill_in "Image", with: @product.image_id
    fill_in "Introduce", with: @product.introduce
    fill_in "Name", with: @product.name
    fill_in "Price", with: @product.price
    check "Product status" if @product.product_status
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "destroying a Product" do
    visit products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product was successfully destroyed"
  end
end
