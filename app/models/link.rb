class Link < ActiveRecord::Base
  attr_accessible :banner, :title, :url
  has_attached_file :banner,
                    :path => ":rails_root/public/system/:attachment/:id/:filename",
                    :url => "/system/:attachment/:id/:filename"
end
