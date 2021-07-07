class OrderSerializer
  include JSONAPI::Serializer
  attributes :created_at

  belongs_to :user, meta: proc { |access_token, _params|
    { username: access_token.user.username }
  }
end
