require 'minitest/autorun'
require './zoo'

class ZooTest < MiniTest::Test

  def setup
    @zoo = Zoo.new "Houston, TX"
  end


  def test_zoos_are_in_a_city
    assert_equal "Houston, TX", @zoo.city
  end

  def test_zoos_can_have_an_animal
    @zoo.add_animal(:zebra)

    assert_includes @zoo.animals, :zebra
  end

  def test_can_feed_animals
    @zoo.add_animal(:zebra)

    assert_equal true, @zoo.hungry?(:zebra)

    @zoo.feed(:zebra)

    assert_equal false, @zoo.hungry?(:zebra)
  end

  def test_can_see_the_fed_animals
    @zoo.add_animal(:zebra)
    @zoo.add_animal(:lions)
    @zoo.add_animal(:snakes)
    @zoo.feed(:zebra)
    @zoo.feed(:lions)

    assert_equal true, @zoo.hungry?(:snakes)
    assert_equal true, @zoo.full?(:zebra)
    assert_equal true, @zoo.full?(:lions)
  end

  def test_if_a_new_day_all_animals_are_hungry

    @zoo.add_animal(:zebra)
    @zoo.add_animal(:lions)
    @zoo.feed(:zebra)
    @zoo.feed(:lions)

    @zoo.advance_day
    assert_equal true, @zoo.hungry?(:zebra)
    assert_equal true, @zoo.hungry?(:lions)

  end
end
