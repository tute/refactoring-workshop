require 'minitest/autorun'
require_relative 'app'

class FormatterTest < Minitest::Test
  def test_transformation
    output = Formatter.new.row_per_day_format path('fixtures/input.csv')
    assert_equal output, File.read(path('fixtures/output.csv'))
  end

  def path(file_name)
    in_path = File.expand_path File.join(File.dirname(__FILE__), file_name)
  end
end
