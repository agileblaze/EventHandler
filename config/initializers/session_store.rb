# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_eventhandler_session',
  :secret      => '68086e2d77c2f99238344b84af0f2ccc3e2235f6c7dedd3c0301f68439d65b16103cbfa9ae79417a79734beb57daa122fae833839fdbf0197961c6dac8c94af0'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
