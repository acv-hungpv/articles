class Article < ApplicationRecord
  has_many :texts
  has_many :images

  validates :title, presence: true
  validates :like, presence: true, numericality: { greater_than_or_equal_to: 0}
  
  def content_text_and_url_image
    contentText = Text.includes(:article).where(article_id: self.id).references(:article).pluck(:cauvan)
    contentImage = Image.includes(:article).where(article_id: self.id).references(:article).pluck(:urlhinh)
  end

  def show_order_content_texts_and_images
    contentText = Text.includes(:article).where(article_id: self.id).references(:article).pluck(:cauvan,:trinhtuhienthi)
    contentImage = Image.includes(:article).where(article_id: self.id).references(:article).pluck(:urlhinh,:trinhtuhienthi)
    twoArray = contentText + contentImage
    twoArray = twoArray.sort {|a,b| a[1] <=> b[1]}
    twoArray.map{|i| i.first}
  end

  def show_order_instances_texts_and_images
    contentText = Text.includes(:article).where(article_id: self.id).references(:article)
    contentImage = Image.includes(:article).where(article_id: self.id).references(:article)
    twoArray = contentText + contentImage
    twoArray = twoArray.sort {|a,b| a.trinhtuhienthi <=> b.trinhtuhienthi}
  end

  def is_published
    return !self.id.nil?
  end

  def is_completed
    return self.is_published && self.created_at < DateTime.now
  end

  def make_completed
    return self.save if self.id.nil?
  end

  def currentLike
    return self.like
  end

  def increaseLike
    self.like += 1
    self.save
    return self.like
  end
end