# Equire

You can forget `require`.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'equire'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install equire

## Usage

**DO NOT USE THIS GEM ON PRODUCTION**

For example:

```bash
# It does not work. You need `require 'uri'`
$ ruby -e 'p URI.parse("https://example.com")'
-e:1:in `<main>': uninitialized constant URI (NameError)

# But if you add `-require` option to ruby, it works!
$ ruby -require -e 'p URI.parse("https://example.com")'
#<URI::HTTPS https://example.com>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pocke/equire.


License
-------

Copyright 2017 Masataka Pocke Kuwabara

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
