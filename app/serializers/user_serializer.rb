class UserSerializer
    include FastJsonapi::ObjectSerializer
    attributes :username, :email, :healths
end