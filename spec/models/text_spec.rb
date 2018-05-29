require 'rails_helper'

RSpec.describe Text, type: :model do
  
  context "Validate" do
    it { should validate_numericality_of(:like).is_greater_than_or_equal_to(0) }
  end  

  context 'Associations' do
    it { should belong_to(:article) }
  end

  it "expect current like" do 
    text = create(:text)
    expect(text.currentLike).to eq text.like
  end

  it "expect increase like" do
    text = create(:image)
    currentlike = text.like
    expect(text.increaseLike).to eq (currentlike + 1)
  end
end