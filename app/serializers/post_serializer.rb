class PostSerializer < ActiveModel::Serializer
  belongs_to :user
  attributes :id, :title, :body, :created_at
end