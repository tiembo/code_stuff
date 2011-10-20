# i'm assuming that there are no 0-calorie activities

class Dropbox
  attr_accessor :exercises, :food

  def initialize(list_string)
    @exercises = []
    @food = []
    parse_list(list_string)
  end

  private

  def parse_list(string)
    return if string.blank?

  end
end

class Activity
  attr_reader :name, :calories

  def initialize(name, calories)
    @name, @calories = name, calories
  end
end

##################################################
# tests
##################################################
require 'test/unit'

class TestActivity < Test::Unit::TestCase
  def setup
    @act_a_values = ["Foo", 100]
    @act_b_values = ["Bar", -50]
    @act_a = Activity.new(@act_a_values.first, @act_a_values.last)
    @act_b = Activity.new(@act_b_values.first, @act_b_values.last)
  end

  def test_should_assign_values
    assert_equal @act_a_values, [@act_a.name, @act_a.calories]
    assert_equal @act_b_values, [@act_b.name, @act_b.calories]
  end

  def test_should_parse_list
  end
end

class TestDropbox < Test::Unit::TestCase
  def setup
  end

end

