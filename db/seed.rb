class Seeder

  def self.seed!
    users
    posts
    comments
  end

  def self.users
    User.create(uname: 'kalle', pass: 'hejhej')
    User.create(uname: 'richard', pass: 'hejhej')
  end

  def self.posts
    Post.create(title: 'Kalas', content: 'Grillkorv', user_id: '1')
    Post.create(title: 'Oboy', content: 'Banan', user_id: '2')
  end

  def self.comments
    Comment.create(comment: 'Kalas', post_id: '1', user_id: '2')
    Comment.create(comment: 'Gott', post_id: '2', user_id: '1')
  end

end