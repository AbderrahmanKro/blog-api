json.extract! @article, :id, :title, :content
json.comments @article.comments do |comment|
  json.extract! comment, :id, :content
end
