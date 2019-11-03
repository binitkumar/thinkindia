json.extract! gallery_pic, :id, :user_id, :pic_collection, :created_at, :updated_at
json.url gallery_pic_url(gallery_pic, format: :json)
