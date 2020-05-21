module Cases
  



  def semi_colon(file, fix)
    info = 'Don’t use ; to terminate statements and expressions.'
    arr = []
    file.each_with_index { |v, i| arr << ["line: #{i + 1}", fix, info, ['...',v, '...']] if v.strip[v.strip.size - 1] == ';' }
    arr
  end

  def space_braces(file, fix)
    info = 'No spaces after (, [ or before ], ). Use spaces around { and before }.'
    arr = []
    file.each_with_index do |v, i|
      v.strip.each_char.with_index do |c, id|
        if id + 1 < v.size && c.match(/^(\(|\[)$/) && v.strip[id + 1] == ' '
          arr << ["line: #{i + 1}", fix, info, ['...',v, '...']]
        elsif (id - 1).positive? && ((c.match(/^(\)|\])$/) && v.strip[id - 1] == ' ') || ((c.match(/^(\})$/) && v.strip[id - 1] != ' ')))
          arr << ["line: #{i + 1}", fix, info, ['...',v, '...']]
        elsif id + 1 < v.size && (id + 1).positive? && c.match(/^(\{)$/) && (v.strip[id + 1] != ' ' || v.strip[id - 1] != ' ')
          arr << ["line: #{i + 1}", fix, info, ['...',v, '...']]
        end
      end
    end
    arr
  end

  def space_after_bang(file, fix)
    info = 'No space after !.'
    arr = []
    file.each_with_index do |v, i|
      v.strip.each_char.with_index do |c, id|
        if id + 1 < v.size && c.match(/^(!)$/) && v.strip[id + 1] == ' '
          arr << ["line: #{i + 1}", fix, info, ['...',v, '...']]
        end
      end
    end
    arr
  end

  def line_between_methods(file, fix)
    info = 'Use empty lines between method definitions and also to break up methods into logical paragraphs internally.'
    arr = []
    file.each_with_index do |v, i|
      if i + 1 < file.size && file[i + 1].strip.include?('def ') && (v.strip == 'end' || v.strip.include?('def '))
        arr << ["line: #{i + 1}", fix, info, ['...', v, file[i + 1], '...']]
      end
    end
    arr
  end

  def several_lines(file, fix)
    info = 'Don’t use several empty lines in a row.'
    arr = []
    file.each_with_index do |v, i|
      if i + 2 < file.size && file[i + 1].strip.empty? && file[i + 2].strip.empty?
        arr << ["line: #{i + 1}", fix, info, ['...', v, file[i + 1], file[i + 2], '...']]
      end
    end
    arr
  end

  def one_class(file)
    info = 'Aim to have just a single class/module per source file.'
    arr = []
    val = []
    file.each_with_index do |v, i|
      val << ["line: #{i + 1}", v] if v.split(' ').include?('class') || v.split(' ').include?('module')
    end
    arr << ['class/module limit',false, info, ['...',val, '...']] if val.size > 1
    arr
  end
end
