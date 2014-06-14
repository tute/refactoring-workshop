#!/usr/bin/env ruby -w
require 'minitest/autorun'

class FormatterTest < Minitest::Test
  def test_la
    input_file = File.expand_path('../fixtures/input.csv', __FILE__)
    output_file = File.expand_path('../fixtures/output.csv', __FILE__)
    output = Formatter.new.row_per_day_format(input_file)
    assert_equal output, File.read(output_file)
  end
end
