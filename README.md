# Simple BDD

Simple BDD offers basic Behaviour Driven Development language syntax. It enables tests to take steps to become more declaritive than imperiative by hiding the implementation and revealing test intent. It can be used in any test framework as it's just a way to keep the collaborative business language within a test by calling methods which directly relate to the step in the test.


## Installation

Add this line to your application's Gemfile:

    gem 'simple_bdd'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_bdd

## Usage

The following will call the 'something_happens' method in scope of the current class or module.  

	[Gg]iven "Some state" # calls some_state
	[Ww]hen "this happens" # calls this_happens
	[Tt]hen "this change occurs" #calls this_change_occurs
	[Aa]nd "this other side effect happens" #this_other_side_effect_happens
	[Bb]ut "this other thing still happens" #this_other_thing_still_happens
	
## RSpec

You'll need to require SimpleBDD in the spec helper and include it into your tests like so:

	require 'simple_bdd'

	RSpec.configure do |config|
  	  config.include SimpleBdd
	end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
