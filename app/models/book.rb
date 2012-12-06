class Book < ActiveRecord::Base
  attr_accessible :description, :publisher_text, :publisher_url, :summary, :title, :cover
  
  has_attached_file :cover,
                    :styles => { :thumb => "100x129", :full => '330x427' },
                    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                    :url => "/system/:attachment/:id/:style/:filename"
end
