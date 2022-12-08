class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body, :username, :user_id, :parent_id
end
