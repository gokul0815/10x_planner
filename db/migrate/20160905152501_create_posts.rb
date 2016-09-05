class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :day
      t.text :goals_first
      t.text :quote_of_the_day
      t.text :targets
      t.text :successes
      t.text :goals_second

      t.timestamps
    end
  end
end
