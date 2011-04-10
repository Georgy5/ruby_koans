require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutNumbers < EdgeCase::Koan
  def test_arithmetic_operation_between_two_integers_yields_an_integer_result
    result = 3 + 2
    assert_equal __, result
    assert_equal __, result.is_a?(Fixnum)

    result = 3 / 2
    assert_equal __, result
    assert_equal __, result.is_a?(Fixnum)
  end

  def test_arithmetic_operation_might_change_the_result_type
    result = 3
    result /= 2.0
    assert_equal __, result
    assert_equal __, result.class

    v1 = 100000000000000000000
    v2 = 10000000000000000000
    assert_equal __, v1.class
    assert_equal __, v2.class
    v1 /= v2
    assert_equal __, v1.class
  end

  def test_you_need_to_be_careful_about_a_type_mixed_arithmetic_operation
    assert_equal __, 2 / 5 * 10.0 + 9
  end

  def test_numbers_have_various_forms
    assert_equal __, 123_456_7890.class
    assert_equal __, 0d123456790.class
    assert_equal __, 0xfedcba.class
    assert_equal __, 0o765432.class

    assert_equal __, -1.2345e3.class
    assert_equal __, 1.2345e-3.class
    assert_equal __, -6e3.class
    assert_equal __, 6e-3.class
  end

end
