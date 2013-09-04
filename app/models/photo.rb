class Photo < ActiveRecord::Base
  attr_accessible :title, :image
  
  
  
  has_attached_file :image,
                    :styles => { :thumb => "100x100" },
                    :path => ":rails_root/public/system/:attachment/:id/:style/:filename",
                    :url => "/system/:attachment/:id/:style/:filename"
end
