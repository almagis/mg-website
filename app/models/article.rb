class Article < ActiveRecord::Base
  validates :content, :presence => true
  validates :title, :presence => true
  validates :summary, :presence => true
  validates :category_id, :presence => true
  
  belongs_to :user
  belongs_to :category
  has_attached_file :article_img, styles: { article_show: "1000x1000>", article_index: "500x500>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :article_img, content_type: /\Aimage\/.*\z/
end
