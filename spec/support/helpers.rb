require 'support/helpers/user_helpers'

RSpec.configure do |config|
  config.include Features::UserHelpers, type: :feature
end