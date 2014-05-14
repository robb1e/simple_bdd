require 'spec_helper'

describe 'simple_bdd/rspec' do
  it 'includes SimpleBdd in RSpec' do
    Given 'some state'
    When 'this happens'
    Then 'this change occurs'
  end

  def some_state
  end

  def this_happens
  end

  def this_change_occurs
  end
end
