class Image < ActiveRecord::Base
  belongs_to :camp
  has_attached_file :image_url, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image_url, content_type: /\Aimage\/.*\z/
end
