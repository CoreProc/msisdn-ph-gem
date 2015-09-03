# MsisdnPH - Ruby
=====================

[![Gem Version](https://badge.fury.io/rb/msisdn-ph.svg)](http://badge.fury.io/rb/msisdn-ph)
[![Build Status][ico-travis]][link-travis]

Ruby port of the [MsisdnPH - PHP](https://github.com/CoreProc/msisdn-ph-php) library.

Easily validate and manipulate Philippine mobile numbers.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'msisdn-ph'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install msisdn-ph

## Usage

### Validate the mobile number

```ruby
mobileNumber = '09171231234'

if MsisdnPH::Msisdn.validate(mobileNumber)
    puts 'Valid mobile number'
else 
    puts 'Invalid mobile number'
end
```

The `validate` method cleans the given mobile number and validates it so even if the mobile number is malformed or has other characters within it, it will still return true as long as the number is really valid:

```ruby
validMobileNumber = '+639171231234'
validMobileNumber = '+63-917-123-1234'
validMobileNumber = '0917-123-1234'
validMobileNumber = '0917.123.1234'
validMobileNumber = '63 917 123 12 34 '
```

### Instantiate an MSISDN object

You can instantiate an MSISDN object and get a standardized format of your mobile number and even get the telco attached to the mobile number using this object.

```ruby
mobileNumber = '09171231234'

msisdn = MsisdnPH::Msisdn.new(mobileNumber)
```

The MSISDN object will throw an `Exception` if you give it an invalid mobile number, so it's best to either catch the exception OR validate it before creating an MSISDN object.

```ruby
invalidMobileNumber = '0917-123-123'

begin
   msisdn = MsisdnPH::Msisdn.new(invalidMobileNumber)
rescue StandardError
   puts 'The number is invalid'
end
```

OR

```ruby
invalidMobileNumber = '0917-123-123'

if MsisdnPH::Msisdn.validate(invalidMobileNumber) 
    msisdn = MsisdnPH::Msisdn.new(invalidMobileNumber)
else 
   puts 'Invalid mobile number'
end
```

### Return a standardized format of your mobile number

When you've instantiated an `Msisdn` object, you can return the mobile number in any format you want.

```ruby
mobileNumber = '09171231234'

msisdn = MsisdnPH::Msisdn.new(mobileNumber)

puts msisdn.get() // will return 09171231234

puts msisdn.get(true) // will return +639171231234

puts msisdn.get(false, '-') // will return 0917-123-1234

puts msisdn.get(true, '-') // will return +63-917-123-1234

puts msisdn.get(true, '.') // will return +63.917.123.1234
```

### Get the telco operator of a mobile number

You can also get the telco operator of the given mobile number - this is based on the included prefixes we have gathered from the telcos.

We cannot guarantee that this list is updated so use with a grain of salt.

If you want to add to the prefixes, you can find the list inside the `lib/data` directory.

```ruby
mobileNumber = '09171231234'

msisdn = MsisdnPH::Msisdn.new(mobileNumber)

puts msisdn.operator // will return Globe
```

### Get the prefix of a mobile number

You might just want to get the prefix of a mobile number.

```ruby
mobileNumber = '09171231234'

msisdn = MsisdnPH::Msisdn.new(mobileNumber)

puts msisdn.prefix // will return 917
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

[ico-travis]: https://img.shields.io/travis/CoreProc/msisdn-ph-php/master.svg?style=flat-square

[link-travis]: https://travis-ci.org/CoreProc/msisdn-ph-gem