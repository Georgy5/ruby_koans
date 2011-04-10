require File.expand_path(File.dirname(__FILE__) + '/edgecase')

class AboutTimes < EdgeCase::Koan
  def test_now_is_a_synonym_for_new
    t1 = Time.now
    t2 = Time.new
    assert_equal __(true), t1.hour == t2.hour
  end

  def test_the_plus_operator_adds_seconds
    t1 = Time.now
    t2 = t1 + (60 * 60 *24)
    assert_equal __(1), t2.day - t1.day
  end

  def test_the_minus_operator_returns_the_difference_in_seconds
    t1 = Time.mktime(2011, 4, 10)
    t2 = Time.mktime(2011, 4, 9)
    assert_equal __(86400.0), t1 - t2
  end

  def test_strftime_formats_time
    t = Time.mktime(2011, 4, 10, 17, 28, 32)
    assert_equal __("04/10/2011 05:28 pm"), t.strftime("%m/%d/%Y %I:%M %P")
  end
end
