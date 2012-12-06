class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string    :title
      t.string    :summary
      t.text      :description
      t.string    :publisher_url
      t.string    :publisher_text
      t.string    :cover_file_name
      t.string    :cover_image_content_type
      t.integer   :cover_file_size
      t.datetime  :cover_updated_at

      t.timestamps
    end
  end
end
