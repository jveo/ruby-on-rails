require 'faker'

# Generate fake data and populate the tables
50.times do
    user = User.create(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      created_at: Faker::Time.backward(days: 365 * 5), # Random date within the last 5 years
      updated_at: Faker::Time.backward(days: 365 * 5)
    )
  
    1.times do
      article = Article.create(
        user_id: user.id,
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph,
        created_at: Faker::Time.backward(days: 365 * 2), # Random date within the last 2 years
        updated_at: Faker::Time.backward(days: 365 * 2)
      )
  
      10.times do
        comment = Comment.create(
        user_id: user.id,
        article_id: article.id,
        message: Faker::Lorem.sentence,
        created_at: Faker::Time.backward(days: 365), # Random date within the last year
        updated_at: Faker::Time.backward(days: 365)
      )
      end
    end
  end
  
  puts "Data generated successfully."
