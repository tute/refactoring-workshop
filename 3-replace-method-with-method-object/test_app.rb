require_relative "../test_helper.rb"

require_relative 'app'

class ExportJobTest < Minitest::Test
  def test_transformation
    output = ExportJob.new.row_per_day_format path('fixtures/input.csv')
    assert_equal output, File.read(path('fixtures/output.csv'))
  end

  def path(file_name)
    File.expand_path File.join(File.dirname(__FILE__), file_name)
  end
end
