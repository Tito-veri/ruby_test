# frozen_string_literal: true

require 'date'
require 'pathname'
require 'capybara/rspec'
require 'site_prism'
require 'webdrivers/chromedriver'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.filter_run_when_matching :focus

  config.example_status_persistence_file_path = 'spec/examples.txt'

  if config.files_to_run.one?
    config.default_formatter = 'doc'
  end

  config.profile_examples = 10

  config.order = :defined

  Kernel.srand config.seed

  config.before(:context) do
    current_window.resize_to(1920, 1080)
  end
end

# Capybara settings
Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.load_selenium
  options = Selenium::WebDriver::Chrome::Options.new
  # if ENV['GITHUB_ACTIONS'] == 'true'
  #   options.add_argument('headless')
  #   options.add_argument('disable-gpu') if Gem.win_platform?
  # end
  # Workaround https://bugs.chromium.org/p/chromedriver/issues/detail?id=2650&q=load&sort=-id&colspec=ID%20Status%20Pri%20Owner%20Summary
  options.add_argument('disable-site-isolation-trials')
  Capybara::Selenium::Driver.new(app, browser: :chrome, clear_local_storage: false, options: options)
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.app_host = 'https://hotel.testplanisphere.dev'
end

require 'pages/app'
