require_relative 'concerns/browser_error'
require 'capybara'
require 'capybara/dsl'
class Browser
  include Capybara::DSL
  
  def self.try(&block)
    begin
      block.call if block_given?
    rescue => e
      raise BrowserError.new(e.message, e)
    end
  end
  
  def self.visit(url, sleep: 0)
    self.try do
      @session.visit url
      sleep sleep
    end
  end
  
  def self.html
    self.try do
      @session.html
    end
  end
  
  def self.click(element, sleep: 0)
    self.try do
      @session.find(element).trigger("click")
      sleep sleep
    end
  end
  
  def self.scroll_bottom()
    self.try do
      @session.execute_script('window.scrollTo(0,document.body.scrollHeight);')
      sleep 2
    end
  end
  
  def self.search(type, search, minimum: 0, wait: 0)
    self.try do
      return @session.all(type.to_sym, search, minimum: minimum, wait: wait)
    end
  end

end