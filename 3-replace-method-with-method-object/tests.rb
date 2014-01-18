#!/usr/bin/env ruby -w
require 'minitest/autorun'

class FormatterTest < Minitest::Test
  def test_la
    output = Formatter.new.row_per_day_format('fixtures/input.csv')
    assert_equal output, File.read('fixtures/output.csv')
  end
end
