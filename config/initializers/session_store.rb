# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tidytest_session',
  :secret      => '9ae5fcdd0f09b96f96d2e37895d76e2f7547352a4f3131c6d0440b48e260e20426b75c7fd1480eaab391a2ac1d9b1a5729c2a84120469f7b1221b5f1f0dc25c8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
