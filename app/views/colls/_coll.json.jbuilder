json.extract! coll, :id, :title, :body, :created_at, :updated_at
json.url coll_url(coll, format: :json)
