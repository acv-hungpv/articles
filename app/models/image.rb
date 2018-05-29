class Image < ApplicationRecord
  belongs_to :article

  validates :like, presence: true, numericality: { greater_than_or_equal_to: 0}
  
  def currentLike
    return self.like
  end
  
  def increaseLike
    self.like += 1
    self.save
    return self.like
  end
end