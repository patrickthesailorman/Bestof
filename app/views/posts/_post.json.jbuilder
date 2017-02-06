json.extract! post, :id, :category, :title, :content, :pics, :link, :address, :lat, :long, :user_id, :created_at, :updated_at
json.url post_url(post, format: :json)