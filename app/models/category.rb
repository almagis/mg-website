class Category < ActiveRecord::Base
  has_many :articles
  
  has_attached_file :category_img, styles: { category_show: "1000x1000>", category_index: "500x500>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :category_img, content_type: /\Aimage\/.*\z/
end
