require 'minitest/autorun'
require './zoo'

class ZooTest < MiniTest::Test

  def test_zoos_are_in_a_city

    zoo = Zoo.new "Houston, TX"
    assert_equal "Houston, TX", zoo.city
  end
end
