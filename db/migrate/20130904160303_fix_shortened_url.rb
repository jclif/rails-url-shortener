class FixShortenedUrl < ActiveRecord::Migration
  def up
    rename_table :shortened_url, :shortened_urls
  end

  def down
    rename_table :shortened_urls, :shortened_url
  end
end
