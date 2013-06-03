Static parser for [casks](/phinze/homebrew-cask)
================================================

Parses casks statically (and safely) and offers their contents
to anyone who asks the right questions.


INSTALL
-------

It's a gem. Use any of the dozen gem managers out there to
wrangle it onto your system.

```bash
$ gem install castic

$ gem install --no-ri --no-rdoc castic

$ echo "gem 'castic'" >> Gemfile
$ bundle

$ echo "gem 'castic', '~>0.1.0'" >> Gemfile
$ bundle install

$ rvm use 2.0.0
$ rvm gemset create foobar
$ gem install castic

$ brew gem castic
# Don't do that, won't work
```

_(Installing gems: being batshit insane in about fifteen different ways)_


SYNOPSIS
--------

```ruby
require 'castic'

# Load a cask
c = Castic.new 'foo.rb'

c.name          #=> Name according to class name
c.expected_name #=> Name according to file name

c.tree          #=> Parsed cask
c.props         #=> Array of properties

c.props :foo    #=> Array of :foo properties
```


LICENSE
-------

Public Domain

