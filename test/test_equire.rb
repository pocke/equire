require 'test_helper'

class TestEquire < Minitest::Test
  def test_kernel_method
    out, err, = ruby_require_e 'pp 1'
    assert_equal "1\n", out
    assert_equal '', err
  end

  def test_instance_method
    out, err, = ruby_require_e 'p Time.at(0).to_date.year'
    assert_equal "1970\n", out
    assert_equal '', err
  end

  def test_class_method
    out, err, = ruby_require_e 'p Integer.each_prime(10).first'
    assert_equal "2\n", out
    assert_equal '', err
  end

  def test_constant
    out, err, = ruby_require_e 'p URI'
    assert_equal "URI\n", out
    assert_equal '', err
  end
end
