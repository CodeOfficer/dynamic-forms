# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dynamic-forms_session',
  :secret      => '297fb621a5b85b56f736f6ae3ab44ac02bd0f56350af811a3acd6675775a1a93ff7dfebba89ecf97a8f2447b95b5389c3f122a16e23f9b9c41ff000b8792e9cc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
