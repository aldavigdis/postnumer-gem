# Postnumer

The class validates, looks up and associates an Icelandic postal code with its locality.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add postnumer --github=aldavigdis/postnumer-gem --branch 'main'

If bundler is not being used to manage dependencies, install the gem by
installing the `specific_install` gem and then executing `gem specific_install`
like so:

    $ gem install specific_install
    $ gem specific_install https://github.com/aldavigdis/postnumer-gem

## Usage

### Using class methods

```ruby
# If you just want to validate a postal code, you can do it like so:
Postnumer.valid?(310)
=> true

# The `Postnumer.valid?` method will return `false` if the provided code is invalid:
Postnumer.valid?(90210)
=> false

# The `Postnumer.locality` method will provide the postal locality associated with the postal code:
Postnumer.locality(310)
=> "Borgarnes"

# The `Postnumer.locality` method will simply return `nil` if the postal code is invalid.
Postnumer.locality(90210)
=> nil
```

### Using an instance of the Postnumer class

```ruby
# You can initialize an instance of Postnumer by initializing it.
# Note: Postnumer.new will throw an `ArgumentError` if the postal code is invalid.
pnr = Postnumer.new(310)
=> #<Postnumer:0x00007fe5f2401958 @code=310, @locality="Borgarnes">

# Once initialized, the locality can be read by using the `locality` accessor:
pnr.locality
=> "Borgarnes"

# The postal code is also stored in the instance and can be read using the `code` accessor:
pnr.code
=> 310
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/aldavigdis/postnumer-gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/aldavigdis/postnumer-gem/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Postnumer project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/aldavigdis/postnumer-gem/blob/master/CODE_OF_CONDUCT.md).
