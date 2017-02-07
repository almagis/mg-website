class Article < ActiveRecord::Base
  validates :content, :presence => true
  validates :title, :presence => true
  
  belongs_to :user
  belongs_to :category
  has_attached_file :article_img, styles: { article_show: "300x300>", article_index: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :article_img, content_type: /\Aimage\/.*\z/
end
