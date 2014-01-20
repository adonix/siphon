class Video < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  has_attached_file :name, :styles => {
      :medium => { :geometry => "640x480", :format => 'flv' },
      :thumb => { :geometry => "100x100#", :format => 'jpg', :time => 10 }
  }, :processors => [:ffmpeg]
end
