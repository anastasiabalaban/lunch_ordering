params = {
  name: 'Admin',
  role: 1,
  email: 'admin@gmail.com',
  password: '111111',
  password_confirmation: '111111'
}

admin = User.new(params)
if admin.save
  puts 'Admin was added into the database!'
else
  puts 'Admin was not added into the database!'
  puts 'Errors:'
  puts admin.errors.full_messages.join(', ')
end
