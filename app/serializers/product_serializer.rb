class ProductSerializer
  include JSONAPI::Serializer
  attributes :name, :price, :created_at
end
