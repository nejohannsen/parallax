class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string   :title
      t.string   :url
      t.string   :banner_file_name
      t.string   :banner_content_type
      t.integer  :banner_file_size
      t.datetime :banner_updated_at
      
      #TODO Need to add the below. Need to roll back first.
      #t.timestamps
    end
  end
end
