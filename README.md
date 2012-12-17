# Jerkin

Jerkin offers basic Behaviour Driven Development language syntax. It enables tests to take steps to become more declaritive than imperiative by hiding the implementation and revealing test intent. It can be used in any test framework as it's just a way to keep the collaborative business language within a test by calling methods which directly relate to the step in the test.


## Installation

Add this line to your application's Gemfile:

    gem 'jerkin'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jerkin

## Usage

The following will call the 'something_happens' method in scope of the current class or module.  

	[Gg]iven "Some state" # calls some_state
	[Ww]hen "this happens" # calls this_happens
	[Tt]hen "this change occurs" #calls this_change_occurs
	[Aa]nd "this other side effect happens" #this_other_side_effect_happens

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
