class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :uniqueness => true

  belongs_to(
  :users,
  :class_name => "User",
  :foreign_key => :submitter_id,
  :primary_key => :id
  )

  def self.random.code
  end

  def self.create_for_user_and_long_url!(user, long_url)
  end

end