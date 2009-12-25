# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_joey_session',
  :secret      => '2fcf3ce0d7de52025951800a5af7ab59d57e1887be0d44c53c19b818462164c7640f07cc5719342a87992bb003b49013ec2fcf5378311bfe2729d17637992910'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
