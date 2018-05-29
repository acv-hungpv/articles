require 'rails_helper'

RSpec.describe Image, type: :model do
  
  context "Validate" do
    it { should validate_numericality_of(:like).is_greater_than_or_equal_to(0) }
  end  

  context 'Associations' do
    it { should belong_to(:article) }
  end

  it "expect current like" do 
    image = create(:image)
    expect(image.currentLike).to eq image.like
  end

  it "expect increase like" do
    image = create(:image)
    currentlike = image.like
    expect(image.increaseLike).to eq (currentlike + 1)
  end
end