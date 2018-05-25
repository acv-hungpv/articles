class Text < ApplicationRecord
  belongs_to :article
  def currentLike
    self.like
  end
  def increaseLike
    self.like += 1
  end
end