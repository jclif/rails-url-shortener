class CreateVisits < ActiveRecord::Migration
  def up
    create_table :visits do |t|
      t.integer :submitter_id
      t.integer :short_url_id

      t.timestamps
    end


  end

  def down
    drop_table :visits
  end

end
