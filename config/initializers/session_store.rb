# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_wr-teaser_session',
  :secret      => 'e506de62fca43c13a939252a62a92c3d0e6227be1953c07b750e4e8e4440b2b2a787b2a9d14a2006fe296a3a20ce0b9f2da9a87a40f644f3480581ca8e1f7dd4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
