class ShortenedUrl < ActiveRecord::Base
  validates :short_url, :uniqueness => true

  belongs_to(
  :users,
  :class_name => "User",
  :foreign_key => :submitter_id,
  :primary_key => :id
  )

  def self.random
    SecureRandom::urlsafe_base64
  end

  def self.create_for_user_and_long_url!(user, long_url)
    random_string = random
    while self.all.any? { |x| x.short_url == random_string}
      random_string = random
    end

    s = ShortenedUrl.new
    s.short_url = random_string
    # p "user #{user.id}"
    s.submitter_id = user.id
    s.long_url = long_url
    s.save!
  end

  def num_clicks
    Visit.count(:conditions => ["short_url_id = ?", self.id])
  end

  def num_uniques
    Visit.where("short_url_id = ?", self.id).count("submitter_id", :distinct => true)
  end

  def num_recent_uniques
    Visit.where("short_url_id = ?", self.id).where(:created_at => (10.minutes.ago)..(Time.now)).count("submitter_id", :distinct => true)
  end

end