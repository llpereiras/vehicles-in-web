require_relative 'browser'
require 'capybara/poltergeist'
class PhantomClient < Browser
  
  def self.new_session
    self.try do
      # Register PhantomJS (aka poltergeist) as the driver to use
      options = {
        js_errors: false,
        phantomjs: Phantomjs.path
      }
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app, options)
      end
      
      # Configure Capybara to use Poltergeist as the driver
      Capybara.default_driver = :poltergeist
      Capybara.javascript_driver = :poltergeist
      
      # Use XPath as the default selector for the find method
      Capybara.default_selector = :xpath
      
      # Start up a new thread
      # @session = Capybara::Session.new(:poltergeist)
      @session = Capybara::Session.new(:poltergeist)
      
      # Report using a particular user agent
      @session.driver.headers = { 'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X)" }
      
      @session
    end
  end
  
  def self.capture(url, path)
    @session.driver.resize(1366, 768)
    @session.driver.headers = {
      "User-Agent" => "Webshot 1.0",
    }
    
    self.visit(url)
    
    if @session.driver.status_code == 200
      # Save screenshot
      @session.driver.save_screenshot(path, :full => true)
    else
      # Handle error
    end
  end

end