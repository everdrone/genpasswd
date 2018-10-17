require "test_helper"

class GenpasswdTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Genpasswd::VERSION
  end

  def test_that_can_generate_character_set
    assert ::Genpasswd.generate_set(6).match /^[a-z]{6}$/
  end

  def test_that_can_insert_capital_letter
    str = ::Genpasswd.insert_capital('abcde', 1)
    assert str.match /^[a-zA-Z]+$/
    assert str.match /[A-Z]{1}/
  end

  def test_that_can_insert_digit
    str = ::Genpasswd.insert_number('password', 1)
    assert str.match /^(\w|\d)+$/
    assert str.match /\d{1}/
  end

  def test_can_concatenate_sets
    str = '123456abcdef987654' # 6 * 3 digits
    assert ::Genpasswd.prepare(str, 6).match /^(\d|\w){6}\-(\d|\w){6}\-(\d|\w){6}$/
  end

  def test_can_make_password
    str = ::Genpasswd.make
    assert str.match /\-/
    assert str.match /(\w|\d){6}/
    assert str.match /\d{1}/
    assert str.match /[A-Z]{1}/
  end
end
