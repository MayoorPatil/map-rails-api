class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :content, :image_url
end
