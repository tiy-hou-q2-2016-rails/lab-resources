class Zoo

  attr_accessor :city, :animals

  def initialize(city_name)
    @city = city_name
    @animals = []
    @hungry_animals = []
  end

  def add_animal(animal)
    @animals << animal
    @hungry_animals << animal
  end

  def hungry?(animal)
    @hungry_animals.include? animal
  end

  def feed(animal)
    # remove from the hungry animals array
    # [:zebra, :tortoise]
    index_of_animal_in_array = @hungry_animals.index( animal)
    @hungry_animals.slice!( index_of_animal_in_array  )
  end

  def full?(animal)
    full_animals.include?(animal)
  end

  def full_animals
    @animals - @hungry_animals
  end

  def advance_day
    @hungry_animals = @animals
  end
end
