require  'spec_helper'
require File.expand_path('../../3-replace-method-with-method-object/app.rb', __FILE__)

describe Formatter do
  describe "#row_per_day_format" do
    let(:input_file) { File.expand_path(File.join(File.dirname(__FILE__), '../' '3-replace-method-with-method-object', 'fixtures','input.csv')) }
    let(:output_file) { File.expand_path(File.join(File.dirname(__FILE__), '../' '3-replace-method-with-method-object', 'fixtures','output.csv')) }
    before do
      @output = Formatter.new.row_per_day_format(input_file)
    end
    it { @output.should == File.read(output_file) }
  end
end