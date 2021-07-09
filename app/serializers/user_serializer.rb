class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :first_name, :last_name, :initials, :email
end
