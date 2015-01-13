require_relative 'name_values'
require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'

class NameValuesTest < MiniTest::Test

  def test_it_has_all_letters_in_alphabet
    name_values = NameValues.new
    name_values.letters.include?("a")
    name_values.letters.include?("r")
    name_values.letters.include?("z")
  end

  def test_letters_have_values
    name_values = NameValues.new
    assert_equal 1, name_values.letter_values["a"]
    
    assert_equal 2, name_values.letter_values["b"]
    assert_equal 26, name_values.letter_values["z"]
  end

  def test_it_scores_a_two_letter_name
    name_values = NameValues.new
    score = name_values.score_name("ab")
    assert_equal 2, score 
  end

  def test_it_scores_a_two_letter_name
    name_values = NameValues.new
    score = name_values.score_name("az")
    assert_equal 26, score 
  end

  def test_it_scores_name_with_spaces
    name_values = NameValues.new
    score = name_values.score_name("ab ab")
    assert_equal 4, score 
  end
end
