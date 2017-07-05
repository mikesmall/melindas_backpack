require 'minitest/autorun'
require 'minitest/pride'
require 'factory_girl'
require 'pry'

require './backpack.rb'
require './factories.rb'

class BackpackTest < MiniTest::Test

  include FactoryGirl::Syntax::Methods

  ##### TESTS ABOUT BRINGING THE RIGHT CLOTHING #####
  # def test_that_always_has_pants_and_shirt
  #   backpack = build(:backpack)
  #   assert(backpack.items.include?('pants'))
  #   assert(backpack.items.include?('shirt'))
  # end
  #
  # def test_that_brings_umbrella_when_rainy
  #   backpack = build(:backpack, weather: 'rainy')
  #   assert(backpack.items.include?('umbrella'))
  # end
  #
  # def test_that_brings_jacket_when_cold
  #   backpack = build(:backpack, weather: 'cold')
  #   assert(backpack.items.include?('jacket'))
  # end
  #
  # ##### TESTS ABOUT PACKED LUNCHES #####
  # def test_that_packs_lunch_on_all_weekdays
  #   ['monday', 'tuesday', 'wednesday', 'thursday', 'friday'].each do |day|
  #     backpack = build(:backpack, day_of_week: day)
  #     assert(backpack.items.include?('packed lunch'))
  #   end
  # end
  #
  # def test_that_doesnt_pack_lunch_on_weekends
  #   ['saturday', 'sunday'].each do |day|
  #     backpack = build(:backpack, day_of_week: day)
  #     refute(backpack.items.include?('packed lunch'))
  #   end
  # end
  #
  #
  # ###### TESTS ABOUT GYM SHOES... wait, where are the tests about gym shoes? #####
  # # is something missing here?
  def test_shoes_sunday
    backpack = build(:backpack, day_of_week: 'sunday')
    assert backpack.items.include?('gym shoes') == false
  end
  def test_shoes_monday
    backpack = build(:backpack, day_of_week: 'monday')
    assert backpack.items.include?('gym shoes') == true
  end
  def test_shoes_tuesday
    backpack = build(:backpack, day_of_week: 'tuesday')
    assert backpack.items.include?('gym shoes') == false
  end
  def test_shoes_wednesday
    backpack = build(:backpack, day_of_week: 'wednesday')
    assert backpack.items.include?('gym shoes') == false
  end
  def test_shoes_thursday
    backpack = build(:backpack, day_of_week: 'thursday')
    assert backpack.items.include?('gym shoes') == true
  end
  def test_shoes_friday
    backpack = build(:backpack, day_of_week: 'friday')
    assert backpack.items.include?('gym shoes') == false
  end
  def test_gym_shoes_saturday
    backpack = build(:backpack, day_of_week: 'saturday')
    assert backpack.items.include?('gym shoes') == false 
  end

  ##### TESTS ABOUT PRINTING THE LIST #####
  def test_that_backpack_prints_correctly
    backpack = build(:backpack, day_of_week: 'monday', weather: 'sunny')
    expected =
"Melinda, here's your packing list!
Day: monday, Weather: sunny

- pants
- shirt
- gym shoes
- packed lunch"
    assert_equal(backpack.my_func, expected)
  end

end
