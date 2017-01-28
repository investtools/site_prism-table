$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "site_prism/table"
require 'capybara/dsl'
require 'selenium/webdriver'

Capybara.default_driver = :selenium