# Jerkin

Jerkin offers simple Gherkin language features in tests. It turns strings into method calls so tests can be descriptive and readable without requiring regular expressions that Cucumber gives.

## Installation

Add this line to your application's Gemfile:

    gem 'jerkin'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jerkin

## Usage

The following will call the 'something_happens' method in scope of the current class or module.

	given "Some state" # calls some_state
	when "this happens" # calls this_happens
	then "this change occurs" #calls this_change_occurs
	and "this other side effect happens" #this_other_side_effect_happens

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
