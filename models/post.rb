class Post
  include DataMapper::Resource

  property :id, Serial
  property :title, String, required: true
  property :content, Text, required: true

  belongs_to :user
  has n, :comments
end