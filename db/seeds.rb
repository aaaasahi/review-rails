10.times do
  Article.create(
    title: Faker::Lorem.sentence(word_count: 5),
    content: Faker::Lorem.sentence(word_count: 100)
  )
end
