module WhiteSpace
  def trailing_white_space(file, fix , arr=[])
    info = 'Avoid trailing whitespace.'
    file.each_with_index do |v, i|
      if (!v.empty? && v.strip.empty?) || (!v.strip.empty? && v.strip.include?('  '))
        arr << ["line: #{i + 1}", fix, info, ['...',v, '...']] 
        white_space_fix(file, arr, i)  if fix
      end
    end
    [arr,file]
  end

  def white_space_fix(file, arr, id)
    val=file[id]
    return "" if val.strip.empty?
    indent=0
    val.each_char { |v1| v1 == ' ' ? indent += 1 : break }
    i=0
    while i<val.size 
      j=i+1
      while j<val.size
        if val[i..j].strip.empty? && val[i..j].size>0
          file[id]=" "*indent+val[0..i].strip+" "+val[j...val.size].strip
        end
        j+=1
      end
      i+=1
    end
    trailing_white_space(file, true, arr )
  end
end