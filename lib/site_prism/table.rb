require "site_prism/table/version"
require 'nokogiri'

module SitePrism
  module Table

    autoload :Element,    'site_prism/table/element'
    autoload :Definition, 'site_prism/table/definition'

    def table(name, *selector, &block)
      definition = Definition.new(&block)
      define_method name do
        Element.new(page.find(*selector)['innerHTML'], definition)
      end
    end
  end
end
