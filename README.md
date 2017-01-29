# SitePrism::Table

SitePrism::Table extends [SitePrism](https://github.com/natritmeyer/site_prism)
making it easer and faster to parse `<table>` elements.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'site_prism-table'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install site_prism-table

## Usage

Example:

```ruby
require 'site_prism'
require 'capybara/dsl'
require 'site_prism/table'
require 'selenium-webdriver'
require 'pp'

Capybara.default_driver = :selenium

class W3SchoolsTablesPage < SitePrism::Page
  extend SitePrism::Table
  set_url 'http://www.w3schools.com/html/html_tables.asp'
  table :customers, '#customers' do
    column :company
    column :contact, format: ->(s) { s.upcase }
    column :country
  end
end

page = W3SchoolsTablesPage.new
page.load
pp page.customers.rows

# [{:company=>"Alfreds Futterkiste",
#   :contact=>"MARIA ANDERS",
#   :country=>"Germany"},
#  {:company=>"Centro comercial Moctezuma",
#   :contact=>"FRANCISCO CHANG",
#   :country=>"Mexico"},
#  {:company=>"Ernst Handel", :contact=>"ROLAND MENDEL", :country=>"Austria"},
#  {:company=>"Island Trading", :contact=>"HELEN BENNETT", :country=>"UK"},
#  {:company=>"Laughing Bacchus Winecellars",
#   :contact=>"YOSHI TANNAMURI",
#   :country=>"Canada"},
#  {:company=>"Magazzini Alimentari Riuniti",
#   :contact=>"GIOVANNI ROVELLI",
#   :country=>"Italy"}]
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/investtools/site_prism-table. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

