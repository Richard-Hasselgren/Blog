class Post
  include DataMapper::Resource

  property :id, Serial
  property :title, String, required: true
  property :content, String

  belongs_to :user
end