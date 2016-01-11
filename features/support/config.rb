require 'net/https'
require 'capybara/cucumber'
require 'pg'
require 'rspec/expectations'
require 'cucumber-repeat'
require 'bunny'
require 'curl'
require 'pdf-reader'
require 'elasticsearch'
require 'date'

### Allows you to use the page. commands
include Capybara::DSL

### Configures Capybara to use CSS selectors and use poltergeist driver
Capybara.default_selector = :css
Capybara.default_wait_time = 10
Capybara.app_host = 'http://localhost:4567' # change url
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

### Includes Capybara (the visit, find, fill_in commands) and poltergeist (channel to phantomjs headless browser)
require 'capybara/poltergeist'

### Set the options for poltergeist to use
Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
    app,
    :headers => { "User-Agent" => "Mozilla/5.0 (Unknown; Linux i686) AppleWebKit/534.34 (KHTML, like Gecko) PhantomJS/1.9.1 Safari/534.34", "Referer" => "", "iv-user" => "tester_user", "iv-groups" => "drv" },
    inspector: true,
    timeout: 240,
    js_errors: false,
    phantomjs_options: [
      '--ignore-ssl-errors=yes',
      '--local-to-remote-url-access=yes'
    ]
  )
end

page.driver.headers = { "User-Agent" => "Mozilla/5.0 (Unknown; Linux i686) AppleWebKit/534.34 (KHTML, like Gecko) PhantomJS/1.9.1 Safari/534.34", "Referer" => "", "iv-user" => "tester_user", "iv-groups" => "drv" }

`sh install_requirements.sh`

$db_connection = PG::Connection.open(
  host: "#{$POSTGRES_HOST}",
  dbname: "#{$POSTGRES_DB}",
  user: "#{$POSTGRES_USER}",
  password: "#{$POSTGRES_PASSWORD}"
)
