json.extract! post, :id, :user_id, :title, :content, :is_published, :is_moderated, :created_at, :updated_at
json.url post_url(post, format: :json)
