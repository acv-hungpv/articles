FactoryBot.define do
  factory :article do 
    title "using factory girl"
    like 0
  end

  factory :text do
    headline "text"
    trinhtuhienthi 0
    like 0
    article
  end 

  factory :image do 
    headline "image"
    trinhtuhienthi 1
    like 1
    article
  end

end