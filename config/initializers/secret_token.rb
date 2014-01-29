# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
Task::Application.config.secret_key_base = '9c15b9ce3280053221d0fa16d9121bd471ee8777c8f7af36399edda3d0f85e821fb5632cb6b03e11f221b6e80ae577dc3a06abac993c1e91a7f0d7b798c0ff7d'
