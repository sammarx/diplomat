require 'diplomat'
Given /^I am setting up a default diplomat$/ do
end

Given /^I am setting up a custom diplomat$/ do
  class StubMiddleware
    def initialize(app, options = {})
      @app = app
      @options = options
    end
    def call(env)
      @app.call(env)
    end
  end

  expect {
    Diplomat.configure do |config|
      config.url = "http://localhost:8500"
      config.middleware = StubMiddleware
    end
  }.to_not raise_error
end
