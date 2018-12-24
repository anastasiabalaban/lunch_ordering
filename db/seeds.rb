params = {
  name: 'Admin',
  role: 'admin',
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD'],
  password_confirmation: ENV['ADMIN_PASSWORD']
}

admin = User.create!(params)
puts 'Admin was added into the database!'
