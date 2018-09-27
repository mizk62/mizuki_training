# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.delete_all
Post.delete_all

3.times do |i|
  i += 1
  user = User.create(
    email: "user#{i}@example.com",
    password: 'password'
  )

  3.times do |j|
    j += 1
    Post.create(
      title: "#{user.email}の記事 その#{j}",
      body: "body#{j} by #{user.email}",
      user_id: user.id
    )

    Like.create(post_id: i, user_id: j)
  end
end
