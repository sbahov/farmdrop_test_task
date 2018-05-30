require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'

Capybara.register_driver :selenium do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--start-fullscreen')
  options.headless! if ENV['HEADLESS'] == 'true'
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

Capybara.default_driver = :selenium
Capybara.ignore_hidden_elements = false
Capybara.default_max_wait_time = 5
Capybara.app_host = ENV['APP_HOST']

SitePrism.configure do |config|
  config.use_implicit_waits = true
end
