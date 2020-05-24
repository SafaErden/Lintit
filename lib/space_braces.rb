# rubocop:disable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity/
# rubocop:disable Style/MultipleComparison
# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/MethodLength

module SpaceBraces
  def space_braces(file, fix, arr = [])
    info = 'No spaces after (, [ or before ], ). Use spaces around { and before }.'

    file.each_with_index do |v, i|
      v.strip.each_char.with_index do |c, id|
        if id + 1 < v.size && (c == '(' || c == '[') && v.strip[id + 1] == ' '
          arr << ["line: #{i + 1}", fix, info, ['...', v, '...']]
          fix_space_braces(file, i, arr) if fix
          break
        elsif (id - 1).positive? && ((c.match(/^(\)|\])$/) && v.strip[id - 1] == ' ') || ((c == '}' && v.strip[id - 1] != ' ')))
          arr << ["line: #{i + 1}", fix, info, ['...', v, '...']]
          fix_space_braces(file, i, arr) if fix
          break
        elsif id + 1 < v.size && (id - 1).positive? && c.match(/^(\{|)$/) && (v.strip[id + 1] != ' ' || v.strip[id - 1] != ' ')
          arr << ["line: #{i + 1}", fix, info, ['...', v, '...']]
          fix_space_braces(file, i, arr) if fix
          break
        end
      end
    end
    [arr, file]
  end

  def fix_space_braces(file, idx, arr)
    v = file[idx].split('')

    v.each_with_index do |c, i|
      if i + 1 < v.size && (c == '(' || c == '[') && v[i + 1] == ' '
        v.delete_at(i + 1)
        break
      elsif (i - 1).positive? && (c == ')' || c == ']') && v[i - 1] == ' '
        v.delete_at(i - 1)
        break
      elsif i + 1 < v.size && c.match(/^(\{)$/) && v[i + 1] != ' '
        v.insert(i + 1, ' ')
        break
      elsif (i - 1).positive? && c.match(/^(\{)$/) && v[i - 1] != ' '
        v.insert(i - 1, ' ')
        break
      elsif (i - 1).positive? && c == '}' && v[i - 1] != ' '
        v.insert(i, ' ')
        break
      end
    end
    file[idx] = v.join('')
    space_braces(file, true, arr)
  end
end
# rubocop:enable Metrics/PerceivedComplexity,Metrics/CyclomaticComplexity/
# rubocop:enable Style/MultipleComparison
# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/MethodLength
