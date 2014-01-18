require 'csv'

# 1. Create a class with same initialization arguments as BIGMETHOD
# 2. Copy & Paste the method's body in the new class, with no arguments
# 3. Replace original method with a call to the new class
# 4. Apply "Intention Revealing Method" to the new class. Woot!
class Formatter
  # More code, methods, and stuff in this big class

  def row_per_day_format(file_name)
    file = File.open file_name, 'r:ISO-8859-1'
    # hash[NivelConsistencia][date] = [[value, status]]
    hash = { '1' => {}, '2' => {} }
    dates = []
    str = ''
    CSV.parse(file, col_sep: ';').each do |row|
      next if row.empty?
      next if row[0] =~ /^\/\//
      date = Date.parse(row[2])
      (13..43).each do |i|
        measurement_date = date + (i-13)

        # If NumDiasDeChuva is empty it means no data
        value  = row[7].nil? ? -99.9 : row[i]
        status = row[i + 31]
        hash_value = [value, status]

        dates << measurement_date
        hash[row[1]][measurement_date] = hash_value
      end
    end

    dates.uniq.each do |date|
      if !hash['1'][date].nil? && hash['2'][date].nil?
        # Only 'bruto' (good)
        value = hash['1'][date]
        str << "#{date}\t#{value[0]}\t#{value[1]}\n"
      elsif hash['1'][date].nil? && !hash['2'][date].nil?
        # Only 'consistido' (kind of good)
        value = hash['2'][date]
        str << "#{date}\t#{value[0]}\t#{value[1]}\n"
      else
        # 'bruto' y 'consistido' (has new and old data)
        old_value = hash['1'][date]
        new_value = hash['2'][date]
        str << "#{date}\t#{new_value[0]}\t#{old_value[1]}\t#{old_value[0]}\n"
      end
    end

    str
  end

  # More code, methods, and stuff in this big class
end
