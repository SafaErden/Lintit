module SemiColon
  def semi_colon(file, fix, arr=[])
    info = 'Don’t use ; to terminate statements and expressions.'
    file.each_with_index do |v, i| 
      if v.strip[v.strip.size - 1] == ';' 
        arr << ["line: #{i + 1}", fix, info, ['...',v, '...']] 
        file[i]=fix_semi_colon(file[i]) if fix
      end
    end
    [arr,file]
  end

  def fix_semi_colon(line)
    indent=0
    line.each_char { |v1| v1 == ' ' ? indent += 1 : break }
    line=" "*indent+line.strip[0...-1]
    line
  end

end