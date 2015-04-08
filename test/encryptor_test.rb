require 'minitest/autorun'
require_relative '../lib/encryptor'

class EncryptorTest < Minitest::Test
  attr_reader :encryptor

  def setup
    @encryptor = Encryptor.new
  end
  
  def test_it_encrypts_one_character
    assert_equal "n", encryptor.encrypt("a")
    assert_equal "o", encryptor.encrypt("b")
    assert_equal "z", encryptor.encrypt("m")
  end

  def test_it_encrypts_two_characters
    assert_equal "no", encryptor.encrypt("ab")
    assert_equal "pq", encryptor.encrypt("cd")
  end

  def test_it_encrypts_five_characters
    assert_equal "nopqr", encryptor.encrypt("abcde")
  end

  def test_it_encrypts_one_characer_from_late_alphabet
    assert_equal "ab", encryptor.encrypt("no")
  end

  def test_it_encrypts_characters_from_both_early_and_late
    assert_equal "yzab", encryptor.encrypt("lmno")
  end

  def test_it_encrypts_spaces_into_spaces
    assert_equal " ", encryptor.encrypt(" ")
    assert_equal "no ", encryptor.encrypt("ab ")
  end

end