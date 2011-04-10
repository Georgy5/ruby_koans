require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutNumbers < EdgeCase::Koan
  def test_arithmetic_operation_between_two_integers_yields_an_integer_result
    result = 3 + 2
    assert_equal __(5), result
    assert_equal __(true), result.is_a?(Fixnum)

    result = 3 / 2
    assert_equal __(1), result
    assert_equal __(true), result.is_a?(Fixnum)
  end

  def test_arithmetic_operation_might_change_the_result_type
    result = 3
    result /= 2.0
    assert_equal __(1.5), result
    assert_equal __(Float), result.class

    v1 = 100000000000000000000
    v2 = 10000000000000000000
    assert_equal __(Bignum), v1.class
    assert_equal __(Bignum), v2.class
    v1 /= v2
    assert_equal __(Fixnum), v1.class
  end

  def test_you_need_to_be_careful_about_a_type_mixed_arithmetic_operation
    assert_equal __(9.0), 2 / 5 * 10.0 + 9
  end

  def test_numbers_have_various_forms
    assert_equal __(Fixnum), 123_456_7890.class
    assert_equal __(Fixnum), 0d123456790.class
    assert_equal __(Fixnum), 0xfedcba.class
    assert_equal __(Fixnum), 0o765432.class

    assert_equal __(Float), -1.2345e3.class
    assert_equal __(Float), 1.2345e-3.class
    assert_equal __(Float), -6e3.class
    assert_equal __(Float), 6e-3.class
  end

  def test_float_does_not_have_bit_shift_operators
    assert_equal __(4), 1 << 2.0
    assert_equal __(1), 2 >> 1.0
    assert_raise(___(NoMethodError)) do
      1.0 << 2
    end
    assert_raise(___(NoMethodError)) do
      2.0 >> 1
    end
  end

end
