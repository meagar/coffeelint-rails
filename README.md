# coffeelint-rails

Simple CoffeeLint rake tasks for Rails

## Installation

Add this line to your application's Gemfile:

    gem 'coffeelint-rails'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install coffeelint-rails

## Usage

This gem provides a simple rake task, `rake lint:coffeescript`.

Invoked with no arguments, it will recursively run all .coffee files found in
app/assets/javascripts through CoffeeLint, reporting errors on the console.

You can pass it a specific file or directory:

    rake lint:coffeescript[app/assets/javascripts/my_file.coffee]

Or a directory to recursively lint:

    rake lint:coffeescript[vendor/assets/javascripts]

By default, it will attempt to load configuration from
`config/coffeelint.json`; you can create this file with the [coffeelint][1]
command:

    coffeelint --writeconfig > config/coffeelint.json

You can specify alternate config via the `COFFEELINT_CONFIG` environment
variable:

    COFFEELINT_CONFIG=~/.coffeelint.json rake lint:coffeescript

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[1]: http://www.coffeelint.org/ 
