class CreateShortenedUrl < ActiveRecord::Migration
  def up
    create_table :shortened_url do |t|
      t.integer :submitter_id
      t.string :short_url
      t.string :long_url

      t.timestamps
    end

    add_index(:shortened_url, :submitter_id)
    add_index(:shortened_url, :short_url)
  end

  def down
    drop_table :shortened_url
  end
end
