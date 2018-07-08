require 'csv'

class RowPerDayFormatter
  NO_DATA = -99.9

  def initialize(file_name)
    @file_name = file_name
    @dates = []
    @result = { '1' => {}, '2' => {} }
  end

  def call
    parse_csv_file_and_build_result
    parsed_data
  end

  private

  attr_reader :dates, :file_name, :result

  def parse_csv_file_and_build_result
    file = File.open file_name, 'r:ISO-8859-1'
    CSV.parse(file, col_sep: ';').each do |row|
      next if row.empty?
      next if row[0] =~ /^\/\//
      (13..43).each { |i| parse_and_populate_result(row, i) }
    end
  end

  def parsed_data
    dates.uniq.map do |date|
      parsed_row_for(date).join("\t") + "\n"
    end.join
  end

  def parsed_row_for(date)
    if bruto?(date)
      value = result['1'][date]
      [date, value[0], value[1]]
    elsif consistido?(date)
      value = result['2'][date]
      [date, value[0], value[1]]
    else
      # 'bruto' y 'consistido' (has new and old data)
      old_value = result['1'][date]
      new_value = result['2'][date]
      [date, new_value[0], old_value[1], old_value[0]]
    end
  end

  def bruto?(date)
    !result['1'][date].nil? && result['2'][date].nil?
  end

  def consistido?(date)
    result['1'][date].nil? && !result['2'][date].nil?
  end

  def parse_and_populate_result(row, i)
    date = Date.parse(row[2])
    measurement_date = date + (i-13)

    # If NumDiasDeChuva is empty it means no data
    value  = row[7].nil? ? NO_DATA : row[i]
    status = row[i + 31]

    dates << measurement_date
    nivel_consistencia = row[1]
    result[nivel_consistencia][measurement_date] = [value, status]
  end
end

class Formatter
  # More code, methods, and stuff in this big class

  def row_per_day_format(file_name)
    RowPerDayFormatter.new(file_name).call
  end

  # More code, methods, and stuff in this big class
end
