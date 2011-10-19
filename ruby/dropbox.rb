# i'm assuming that there are no 0-calorie activities

class Dropbox
  attr_accessor :exercises, :food

  def initialize
    @exercises = []
    @food = []
  end
end

##################################################
# tests
##################################################
require 'test/unit'

class TestDropbox < Test::Unit::TestCase
  def setup

  end

  def test_should_have_default_values
    d = Dropbox.new
    assert_equal [], d.exercises
    assert_equal [], d.food
  end
end
