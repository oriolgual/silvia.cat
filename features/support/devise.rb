include Warden::Test::Helpers
After{ Warden.test_reset! }

Devise.setup do |config|
  config.stretches = 1
end
