module LineLength
  def line_length(file)
    info = 'Limit lines to 100 characters.'
    arr = []
    file.each_with_index { |v, i| arr << ["line: #{i + 1}", false, info, ['...', v, '...']] if v.strip.length > 100 }
    [arr, file]
  end
end
