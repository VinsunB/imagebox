json.array!(@photos) do |photo|
  json.extract! photo, :id, :image, :title, :body
  json.url photo_url(photo, format: :json)
end
