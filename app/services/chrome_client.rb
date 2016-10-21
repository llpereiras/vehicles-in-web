require_relative 'browser'
class ChromeClient < Browser
  
  def self.new_session
    self.try do
      # Register PhantomJS (aka poltergeist) as the driver to use
      options = {js_errors: false}
      
      Capybara.register_driver :chrome do |app|
        Capybara::Selenium::Driver.new(app, :browser => :chrome)
      end
      
      # Configure Capybara to use Poltergeist as the driver
      Capybara.javascript_driver = :chrome
      
      # Use XPath as the default selector for the find method
      Capybara.default_selector = :xpath
      
      # Start up a new thread
      @session = Capybara::Session.new(:chrome)
      
      @session
    end
  end

end