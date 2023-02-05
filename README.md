# Postnumer

The Postnumer class validates, looks up and associates an Icelandic postal code
with its postal locality.

Icelandic postal codes are three numeric digits and may be handled as integers
(as this gem does internally) or as strings (as you should do in your database).

## What this gem does not and will not do

As the role of the Icelandic postal code system is to facilitate mail sorting
and distrubution. This gem will therefore mainly facilitate the validation or
autocompletion of a pair of postal codes and their assigned localities.

What this gem will *not* do is to facilitate the assumtion of other attributes
often associated with Icelandic postal codes. This means that if you plan to use
postal codes to assume things such as wether an Icelandic postal code is rural,
is for a P.O. box, if it is within the Reykjavik Metropolitan Area or which
administrative region it belongs to, you should roll your own solution for your
own application and I wish you good luck in all your future endevours.

The [author of this gem](https://aldavigdis.is/) will gladly provide a paid
lecture on the pitfalls of postal addressing and postal code systems in Iceland
and around the world.

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
# For getting a hash of every Icelandic postal code and its locality,
# you can use `Postnumer::all` to get a list of every valid postal code:
Postnumer.all
=>
{101=>"Reykjavík",
 102=>"Reykjavík",
 103=>"Reykjavík",
 104=>"Reykjavík"}

# `Postnumer.all_options` provides every available postal code in Iceland as an
# array of arrays:
Postnumer.all_options
=>
[["101 Reykjavík", 101],
 ["102 Reykjavík", 102],
 ["103 Reykjavík", 103],
 ["104 Reykjavík", 104]]

# In Rails, you can use features from the `FormOptionsHelper` such as `select`
# or `options_for_select` to build a form field from `Postnumer.all_options`.

# In Rails:
select('customer', 'postal_code', Postnumer.all_options)

# In Formtastic or ActiveAdmin:
f.input(:author, :as => :select,
                 :collection => options_for_select(Postnumer::all_options)
)

# If you just want to validate a postal code, you can do it like so:
Postnumer.valid?(310)
=> true

# Numeric strings can also be passed to any method and will be cast internally using `String::to_i`:
# (You should always store postal codes as strings in your database.)
Postnumer.valid?("101")
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

Don't be afraid of using Rubocop for correcting your code and to make it conform to the standards defined in `.rubocop.yml`. If you need to add an exception, the please do so in your pull request and it will be looked into.

You will want to run `bundle exec rubocop -A` to see if your code has any errors and correct them on the fly.

Any pull request is welcome. Please write rspec tests for any contributed code if you have the capacity to.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Postnumer project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/aldavigdis/postnumer-gem/blob/master/CODE_OF_CONDUCT.md).
