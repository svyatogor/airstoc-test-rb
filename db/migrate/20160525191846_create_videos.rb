class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title

      t.timestamps null: false
    end

    create_table :categories_videos do |t|
      t.belongs_to :video, index: true
      t.belongs_to :category, index: true
    end
  end
end
