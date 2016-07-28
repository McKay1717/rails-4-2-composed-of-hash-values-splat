class User < ActiveRecord::Base
  composed_of :preferences, {
    class_name: 'User::Preferences',
    mapping: %w( preferences to_hash )
  }
end
