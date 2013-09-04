class User < ActiveRecord::Base
  validates :email, :uniqueness => true

  has_many(
  :shortened_urls,
  :class_name => "ShortenedUrl",
  :primary_key => :id
  )

end