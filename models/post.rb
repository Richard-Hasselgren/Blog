class Post
  include DataMapper::Resource

  property :id, Serial
  property :title, String, required: true
  property :content, Text

  belongs_to :user
  has n, :comment
end