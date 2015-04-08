require 'minitest/autorun'
require_relative '../lib/decryptor'

class DecryptorTest < Minitest::Test
  attr_reader :decryptor

  def setup
    @decryptor = Decryptor.new
  end
  
  def test_it_encrypts_one_character
    assert_equal "a", decryptor.decrypt("n")
    assert_equal "b", decryptor.decrypt("o")
    assert_equal "m", decryptor.decrypt("z")
  end

  def test_it_encrypts_two_characters
    assert_equal "ab", decryptor.decrypt("no")
    assert_equal "cd", decryptor.decrypt("pq")
  end

  def test_it_encrypts_five_characters
    assert_equal "abcde", decryptor.decrypt("nopqr")
  end

  def test_it_encrypts_one_characer_from_late_alphabet
    assert_equal "no", decryptor.decrypt("ab")
  end

  def test_it_encrypts_characters_from_both_early_and_late
    assert_equal "lmno", decryptor.decrypt("yzab")
  end

  def test_it_encrypts_spaces_into_spaces
    assert_equal " ", decryptor.decrypt(" ")
    assert_equal "ab ", decryptor.decrypt("no ")
    assert_equal "ab yz", decryptor.decrypt("no lm ")
  end

end