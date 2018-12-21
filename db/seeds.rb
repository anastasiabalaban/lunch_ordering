params = {
  name: 'Admin',
  role: 1,
  email: 'admin@gmail.com',
  password: '111111',
  password_confirmation: '111111',
}

admin = User.create(params)
