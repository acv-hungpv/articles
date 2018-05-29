require 'rails_helper'

RSpec.describe Article, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:like) }
  it { should validate_numericality_of(:like).is_greater_than(-1)}
  it { should have_many(:texts) }
  it { should have_many(:images) }
  it "expect  publish article" do
    article = Article.create(title:"text complete published",like: 0)
    expect(article.is_completed).to eq true
  end

  it "expect  increase like" do
    article = Article.create(title:"text complete published",like: 0)
    expect(article.increaseLike).to eq 1
  end

  it "expect make complete" do
    article = Article.new(title:"text complete published",like: 0)
    expect(article.make_completed).to eq true
  end
end 