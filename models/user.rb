class User
  include DataMapper::Resource

  property :id, Serial
  property :uname, String, required: true, unique: true
  property :pass, BCryptHash, required: true


  has n, :post
  has n, :comment
end