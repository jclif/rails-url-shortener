class User < ActiveRecord::Base
  validates :email, :uniqueness => true

  has_many(
  :shortened_urls,
  :class_name => "ShortenedUrl",
  :primary_key => :id
  )

  has_many(
  :visits,
  :class_name => "Visit",
  :primary_key => :id
  )

end