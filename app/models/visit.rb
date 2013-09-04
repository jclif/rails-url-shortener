class Visit < ActiveRecord::Base
  belongs_to(
  :users,
  :class_name => "User",
  :foreign_key => :submitter_id,
  :primary_key => :id
  )

  belongs_to(
  :shortened_urls,
  :class_name => "ShortenedUrl",
  :foreign_key => :short_url_id,
  :primary_key => :id
  )

end