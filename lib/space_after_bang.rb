module SpaceAfterBang
  def space_after_bang(file, fix, arr = [])
    info = 'No space after !.'

    file.each_with_index do |v, i|
      if v.include?('! ')
        arr << ["line: #{i + 1}", fix, info, ['...', v, '...']]
        fix_space_after_bang(file, i, arr) if fix
      end
    end
    [arr, file]
  end

  def fix_space_after_bang(file, idx, arr)
    file[idx].sub!('! ', '!')
    file[idx].sub!(' !', '!')
    file[idx].sub!('!!', '!')
    space_after_bang(file, true, arr)
  end
end
