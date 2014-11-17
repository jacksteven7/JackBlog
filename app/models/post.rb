class Post < ActiveRecord::Base
  attr_accessible :photo, :title
  validates_presence_of :title,:exists
  belongs_to :user
  FOTOS = File.join Rails.root,'public','photo_store'
  after_save :save_photo

  def photo=(file_data)
  	unless file_data.blank?
  		@file_data = file_data
  		self.ext = file_data.original_filename.split(".").last.downcase
  	end
  end

  def photo_filename
	File.join FOTOS, "#{id}.#{ext}"
  end
  def photo_path
  	"/photo_store/#{id}.#{ext}"
  end
  def has_photo?
  	File.exists? photo_filename
  end
  private
  def save_photo
  	if @file_data 
  		FileUtils.mkdir_p  FOTOS
  		File.open(photo_filename,'wb') do |f|
  			f.write(@file_data.read)
  		end
  		@file_data = nil
  	end
  end


end
