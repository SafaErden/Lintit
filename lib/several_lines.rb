module SeveralLines
  def several_lines(file, fix, arr = [])
    info = 'Don’t use several empty lines in a row.'
    file.each_with_index do |v, i|
      if i + 2 < file.size && file[i + 1].strip.empty? && file[i + 2].strip.empty?
        arr << ["line: #{i + 1}", fix, info, ['...', v, file[i + 1], file[i + 2], '...']]
        fix_several_lines(file, i, arr) if fix
      end
    end
    [arr, file]
  end

  def fix_several_lines(file, i, arr)
    file.delete_at(i + 1)
    several_lines(file, true, arr)
  end
end
