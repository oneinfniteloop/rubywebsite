# include Magick
class Pet < ActiveRecord::Base
	mount_uploader :image, ImageUploader

	validates_processing_of :image
validate :image_size_validation


 
private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if image.size > 0.5.megabytes
  end


  def poster
  manipulate! do |source|
  txt = Magick::Draw.new
  txt.family
  txt.pointsize = 12
  txt.gravity = Magick::SouthGravity
  txt.stroke = "#000000"
  title = Demot.last.title
  source = source.resize_to_fill(400, 400).border(10, 10, "black")
  source.annotate(txt, 0, 0, 0, 40, title)

end
end
end