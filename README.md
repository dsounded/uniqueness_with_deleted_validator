# UniquenessWithDeletedValidator

This gem is useful for `paranoia` + `devise` gem (etc). When you have unique index on some field and you destroy the record with
this value you'll normally have index error on creation new record with such a value. This validator allows to perform proper validation in this case.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uniqueness_with_deleted_validator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uniqueness_with_deleted_validator

## Usage

`validates :email, uniqueness_with_deleted: true`

or

`validates_uniqueness_with_deleted_of :email`

Also you need to add `.activerecord.errors.base.taken` translation to your local `I18n` storage.
Alternatively you can use:
 
 `validates :my_field, uniqueness_with_deleted: { message: 'My awesome message' }`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/uniqueness_with_deleted_validator. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

