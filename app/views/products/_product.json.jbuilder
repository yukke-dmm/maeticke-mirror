json.extract! product, :id, :name, :introduce, :image_id, :price, :genre_id, :product_status, :delete_flag, :created_at, :updated_at
json.url product_url(product, format: :json)
