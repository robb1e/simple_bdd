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
    [Aa]lso "another side effect happens" #another_side_effect_happens

## RSpec

You'll need to require SimpleBDD in the spec helper and include it into your tests like so:

    require 'simple_bdd'

    RSpec.configure do |config|
        config.include SimpleBdd
    end

## Contributing

* Fork it
* Ensure your environment is ready for development:

    $ gem install bundler
    $ rake

* Create your feature branch (`git checkout -b my-new-feature`)
* Write automated tests and ensure tests pass:

    $ rake

* Commit your changes (`git commit -am 'Add some feature'`)
* Push to the branch (`git push origin my-new-feature`)
* Create new Pull Request
