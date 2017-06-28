# Create member Users
10.times do
  User.create!(
    email: Faker::Internet.email,
    password: 'Helloworld',
    password_confirmation: 'Helloworld',
    confirmed_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
  )
end
# Create premium User
1.times do
User.create!(
  email: "admin@admin.com",
  password: 'helloworld',
  password_confirmation: 'helloworld',
  confirmed_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
)
end

# Create admin User

# Create public Wikis
15.times do
  Wiki.create!(
    title: "Public #{Faker::Zelda.game}",
    body: Faker::Lorem.paragraphs,
    private: false,
    user_id: rand(1..10),
    created_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
  )
end

# Create private Wikis
15.times do
  Wiki.create!(
    title: "Private #{Faker::Superhero.name}",
    body: Faker::Lorem.paragraphs,
    private: true,
    user_id: rand(1..10),
    created_at: Faker::Date.between_except(1.year.ago, 1.year.from_now, Date.today)
  )
end

#standard_users = User.where(role: 0)
#premium_users = User.where(role: 1)
#admin_users = User.where(role: 2)
public_wikis = Wiki.where(private: false)
private_wikis = Wiki.where(private: true)

puts "Seed finished"
puts "#{User.count} standard users created"
puts "#{public_wikis.count} public wikis created"
puts "#{private_wikis.count} private wikis created"
puts "Total: Users: #{User.count} | Wikis: #{Wiki.count}"