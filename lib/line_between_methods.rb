module LineBetweenMethods
  def line_between_methods(file, fix, arr = [])
   
    info = 'Use empty lines between method definitions and also to break up methods into logical paragraphs internally.'
    file.each_with_index do |v, i|
      if i + 1 < file.size && file[i + 1].strip.include?('def ') && (v.strip == 'end' || v.strip.include?('def '))
        arr << ["line: #{i + 1}", fix, info, ['...', v, file[i + 1], '...']]
        fix_line_between_methods(file, i, arr) if fix
      end
    end
    [arr, file]
  end

  def fix_line_between_methods(file, i, arr)
    file.insert(i + 1, '')
    line_between_methods(file, true, arr)
  end
end
