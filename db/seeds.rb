# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Article.destroy_all
Text.destroy_all
Image.destroy_all

auto_inc_val = 1
table = 'articles'
ApplicationRecord.connection.execute(
"ALTER SEQUENCE #{table}_id_seq RESTART WITH #{auto_inc_val}"
)

auto_inc_val = 1
table = 'texts'
ApplicationRecord.connection.execute(
"ALTER SEQUENCE #{table}_id_seq RESTART WITH #{auto_inc_val}"
)

auto_inc_val = 1
table = 'images'
ApplicationRecord.connection.execute(
"ALTER SEQUENCE #{table}_id_seq RESTART WITH #{auto_inc_val}"
)

Article.create!(title: 'First article inspection',like: 0, published: false )

Text.create!(headline: 'first', trinhtuhienthi: 1,cauvan: 'A first article inspection (FAI) is a design verification and design', like: 0, article_id: 1)
Text.create!(headline: 'second', trinhtuhienthi: 2,cauvan: 'a formal method of providing a reported measurement for a given manufacturing process. Both the supplier ', like: 0, article_id: 1)
Text.create!(headline: 'third', trinhtuhienthi: 5,cauvan: 'and purchaser perform the First Article on the ordered product', like: 0, article_id: 1)

Image.create!(headline: 'first', trinhtuhienthi:3,urlhinh: "",like: 0, article_id: 1)
Image.create!(headline: 'second', trinhtuhienthi:4,urlhinh: "",like: 0, article_id: 1)
Image.create!(headline: 'third', trinhtuhienthi:6,urlhinh: "",like: 0, article_id: 1)