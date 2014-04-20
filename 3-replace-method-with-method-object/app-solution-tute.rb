#!/usr/bin/env ruby -w
# Tute's approach (after applying the pattern to `app.rb`).
# Tests run here in the same way.

require 'csv'

class FormatAtoB
  SIN_DATOS = -99.9

  def initialize(file_name)
    @file_name = file_name
    @hash  = { '1' => {}, '2' => {} }
    @dates = []
  end

  def perform
    load_format_a_file
    format_data_to_b
  end

  private

  def load_format_a_file
    file = File.open @file_name, 'r:ISO-8859-1'
    CSV.parse(file, col_sep: ';').each do |row|
      next if row.empty? || row[0] =~ /^\/\//
      load_month_in_hash(row)
    end
  end

  def format_data_to_b
    formatted_rows = @dates.uniq.map { |date| formatted_row_for(date) }
    "#{formatted_rows.join("\n")}\n"
  end

  def formatted_row_for(date)
    old_value = @hash['1'][date]
    new_value = @hash['2'][date]
    if dato_bruto?(date)
      day = [date, old_value[0], old_value[1]]
    elsif dato_consistido?(date)
      day = [date, new_value[0], new_value[1]]
    else # 'bruto' y 'consistido'
      day = [date, new_value[0], old_value[1], old_value[0]]
    end
    day.join("\t")
  end

  def load_month_in_hash(row)
    @beginning_of_month = Date.parse(row[2])
    (13..43).each do |i|
      load_day_in_hash(row, i)
    end
  end

  def load_day_in_hash(row, i)
    nivel_consistencia = row[1]
    date = @beginning_of_month + (i - 13)
    @dates << date
    @hash[nivel_consistencia][date] = datos(row, i)
  end

  # If NumDiasDeChuva is empty it means no data
  def datos(row, i)
    data = row[7].nil? ? SIN_DATOS : row[i]
    status = row[i + 31]
    [data, status]
  end

  def dato_bruto?(date)
    @hash['1'][date] && @hash['2'][date].nil?
  end

  def dato_consistido?(date)
    @hash['1'][date].nil? && @hash['2'][date]
  end
end

class Formatter
  def row_per_day_format(file_name)
    FormatAtoB.new(file_name).perform
  end
end

require './tests' if __FILE__ == $0
