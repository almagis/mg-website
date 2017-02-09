class Category < ActiveRecord::Base
  has_many :articles
  
  has_attached_file :category_img, styles: { category_show: "300x300>", category_index: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :category_img, content_type: /\Aimage\/.*\z/
end
