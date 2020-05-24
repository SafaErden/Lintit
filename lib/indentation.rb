# rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity/

module Indentation
  def indentation(file, fix, arr = [])
    info = 'Use two spaces per indentation level (aka soft tabs).'
    file.each_with_index do |v, i|
      c1 = 0
      c2 = 0
      v.each_char { |v1| v1 == ' ' ? c1 += 1 : break } unless v.strip.empty?
      file[i + 1].each_char { |v2| v2 == ' ' ? c2 += 1 : break } if i + 1 < file.size && !file[i + 1].strip.empty?
      if (c2 - c1).abs > 2 && c2 != 0
        arr << ["line: #{i + 2}", fix, info, ['...', v, file[i + 1], '...']]
        indentation_fix(i, c1, c2, file, arr) if fix
      end
    end
    [arr, file]
  end

  def indentation_fix(idx, c11, c21, file, arr)
    file[idx + 1] = if c11 < c21
                      ' ' * (c11 + 2) + file[idx + 1].strip
                    else
                      ' ' * (c11 - 2) + file[idx + 1].strip
                    end
    indentation(file, true, arr)
  end
end
# rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity
