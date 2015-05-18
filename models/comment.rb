class Comment
  include DataMapper::Resource

  property :id, Serial
  property :comment, String, required: true

  belongs_to :user
  belongs_to :post

end