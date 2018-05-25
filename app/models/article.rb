class Article < ApplicationRecord
  has_many :texts
  has_many :images
  
  def content_text_and_url_image
    contentText = Text.includes(:article).where(article_id: self.id).references(:article).pluck(:cauvan,:trinhtuhienthi)
    contentImage = Image.includes(:article).where(article_id: self.id).references(:article).pluck(:urlhinh,:trinhtuhienthi)
    twoArray = contentText + contentImage
    twoArray.sort {|a,b| a[1] <=> b[1]}
  end

  

end