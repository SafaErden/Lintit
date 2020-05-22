module OneClass
  def one_class(file, arr = [])
    info = 'Aim to have just a single class/module per source file.'
    val = []
    file.each_with_index do |v, i|
      val << ["line: #{i + 1}", v] if v.split(' ').include?('class') || v.split(' ').include?('module')
    end
    arr << ['class/module limit', false, info, ['...', val, '...']] if val.size > 1
    [arr, file]
  end
end
