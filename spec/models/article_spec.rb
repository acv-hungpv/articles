require 'rails_helper'

RSpec.describe Article, type: :model do

  context "Validation" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:like) }
    it { should validate_numericality_of(:like).is_greater_than_or_equal_to(0) }
  end

  context 'Associations' do
    it { should have_many(:texts) }
    it { should have_many(:images) }
  end

  it "expect published article" do
    article = Article.create(title:"text complete published",like: 0)
    expect(article.is_completed).to eq true
  end

  it "expect increase like" do
    article = Article.create(title:"text complete published",like: 0)
    expect(article.increaseLike).to eq 1
  end

  it "expect make complete" do
    article = Article.new(title:"text complete published",like: 0)
    expect(article.make_completed).to eq true
  end

  it "expect current like" do 
    article = create(:article)
    expect(article.currentLike).to eq article.like
  end

  it "expect show order instances of texts and images" do 
    article = create(:article)
    text_1 = article.texts.build(headline:" thu tu 1",trinhtuhienthi: 1, like: 0)
    text_3 = article.texts.build(headline:" thu tu 3",trinhtuhienthi: 3, like: 0)
    text_5 = article.texts.build(headline:" thu tu 5",trinhtuhienthi: 5, like: 0)
    image_2 = article.images.build(headline:"thu tu 2",trinhtuhienthi: 2, like:0)
    image_4 = article.images.build(headline:"thu tu 4",trinhtuhienthi: 4, like:0)
    image_6 = article.images.build(headline:"thu tu 6",trinhtuhienthi: 6, like:0)
    texts_and_images = article.texts + article.images
    expect(article.show_order_instances_texts_and_images) == (texts_and_images.sort {|a,b| a.trinhtuhienthi <=> b.trinhtuhienthi})
  end
end 