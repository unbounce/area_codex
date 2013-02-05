# AreaCodex

A ruby gem for determining whether or not a given phone area code is in
a particular country or region.

## Installation

Add this line to your application's Gemfile:

    gem 'area_codex'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install area_codex

## Usage

### By Country

    AreaCodex::Country.new(:canada).include?(604)  # => true
    AreaCodex::Country.new(:canada).exclude?(213)  # => true

    AreaCodex::Region.new(:north_america).include?(604)  # => true
    AreaCodex::Region.new(:north_america).exclude?(213)  # => false

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
