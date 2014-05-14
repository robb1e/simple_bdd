# Simple BDD

Simple BDD offers basic Behaviour Driven Development language syntax. It enables tests to take steps to become more declaritive than imperiative by hiding the implementation and revealing test intent. It can be used in any test framework as it's just a way to keep the collaborative business language within a test by calling methods which directly relate to the step in the test.

## Installation

Add this line to your application's Gemfile:

``` ruby
gem 'simple_bdd'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_bdd

## Usage

### Standard Usage

The following will call commented method in scope of the current class or module.  (Every RSpec `describe` block is an anonymous class.)

``` ruby
[Gg]iven "Some state" # calls some_state
[Ww]hen "this happens" # calls this_happens
[Tt]hen "this change occurs" # calls this_change_occurs
[Bb]ut "this other thing still happens" # calls this_other_thing_still_happens
[Aa]nd "this other side effect happens" # calls this_other_side_effect_happens
```

## Behavior Usage

Some additional methods allow you to group related behaviors in your tests:

``` ruby
Given "Admin is signed in"

behavior "admin can manage widgets" do
  When "Admin views all widgets"
  Then "Admin sees the first widget"
end

behavior "admin can manage factories" do
  When "Admin views all factories"
  Then "Admin sees the first factory"
end
```

Any of the following names can be substituted for `behavior` above:

* `and_by`
* `behaves_like`
* `behavior`
* `behaviour`
* `by`
* `it_also`

## RSpec

To use SimpleBDD in your tests, simply add the following line to your spec helper:

``` ruby
require 'simple_bdd/rspec'
```

Or, if you want to have more control, you can do this instead:

``` ruby
require 'simple_bdd'

RSpec.configure do |config|
  config.include SimpleBdd
end
```

By default, SimpleBDD marks specs pending on missing step implementations.
You can change this behavior to raise an error instead in the spec helper:

``` ruby
RSpec.configure do |config|
  config.raise_error_on_missing_step_implementation = true
end
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
