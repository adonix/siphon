class Video < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }

  has_attached_file :name, :styles => {
      :mp4medium => { :geometry => "640x480", :format => 'mp4', streaming: true, processors: [:ffmpeg, :qtfaststart] },
      :oggmedium => { :geometry => "640x480", :format => 'webm', streaming: true, processors: [:ffmpeg] },
      :flvmedium => { :geometry => "640x480", :format => 'flv', streaming: true, processors: [:ffmpeg], :convert_options => { :input => {}, :output => {'c:v' => 'libx264', ar: '22050', crf: '28', vprofile: 'high', preset: 'medium', 'b:v' => '750k', maxrate: '750k', bufsize: '1500k', pix_fmt: 'yuv420p', 'b:a' => '128k', strict: '-2'}} },
      :thumb => { :geometry => "296x166#", :format => 'jpg', :time => 7 }
  }

  validates :name, presence: true

=begin
  def is_mp4video?
    name.instance.name_content_type =~ %r(mp4)
  end
=end
end
