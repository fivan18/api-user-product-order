class OrderSerializer
  include JSONAPI::Serializer
  attributes :created_at, :products

  belongs_to :user, meta: proc { |order, _params|
    {
      first_name: order.user.first_name,
      last_name: order.user.last_name,
      initials: order.user.initials,
      email: order.user.email
    }
  }
end
