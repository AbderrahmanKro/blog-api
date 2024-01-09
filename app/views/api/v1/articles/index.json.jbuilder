json.array! @articles do |article|
  json.extract! article, :id, :title, :content, :comments
end
