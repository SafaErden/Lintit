module Cases
  def indentation(_file)
    info = 'Use two spaces per indentation level (aka soft tabs).'
    arr = []
    _file.each_with_index do |v,i| 
       c1, c2=0, 0
       v.each_char{|v1| v1==" " ? c1+=1 : break} if v.strip.size>0
       _file[i+1].each_char{|v2| v2==" " ? c2+=1 : break} if i+1 < _file.size && _file[i+1].strip.size>0 
       arr << ["line: #{i+2}", info, ["...",v,_file[i+1],"..."] ] if (c2-c1).abs>2 && c1!=0 && c2!=0  
    end 
    arr
  end

  def line_length(_file)
    info = 'Limit lines to 50 characters.'
    arr = []
    _file.each_with_index { |v,i| arr << ["line: #{i+1}", info, v ] if v.strip.length > 50} 
    arr
  end

  def trailing_white_space(_file)
    info = 'Avoid trailing whitespace.'
    arr = []
    _file.each_with_index do |v,i| 
      arr << ["line: #{i+1}", info, v]  if (v.strip.size==0 && v.size>0) || (v.strip.size>0 && v.strip.include?("  "))
    end
    arr
  end

  def semi_colon(_file)
    info = 'Don’t use ; to terminate statements and expressions.'
    arr = []
    _file.each_with_index { |v,i| arr << ["line: #{i+1}", info, v ] if v.strip[v.strip.size-1]==";"} 
    arr
  end

  def space_braces(_file)
    info = 'No spaces after (, [ or before ], ). Use spaces around { and before }.'
    arr = []
    _file.each_with_index do  |v,i| 
      v.strip.each_char.with_index do |c,id|
        if id+1<v.size && c.match(/^(\(|\[)$/) && v.strip[id+1]==" "
          arr << ["line: #{i+1}", info, v ] 
          break
        elsif id-1>0 && ((c.match(/^(\)|\])$/) && v.strip[id-1]==" ") || ((c.match(/^(\})$/) && v.strip[id-1]!=" ")))
          arr << ["line: #{i+1}", info, v ] 
          break
        elsif id+1<v.size && id+1>0 && c.match(/^(\{)$/) && (v.strip[id+1]!=" " || v.strip[id-1]!=" ")
          arr << ["line: #{i+1}", info, v ] 
          break
        end
      end
    end
    arr
  end

  def space_after_bang(_file)
    info = 'No space after !.'
    arr = []
    _file.each_with_index do  |v,i| 
      v.strip.each_char.with_index do |c,id|
        if id+1<v.size && c.match(/^(!)$/) && v.strip[id+1]==" "
          arr << ["line: #{i+1}", info, v ] 
          break
        end
      end
    end
    arr
  end

  def line_between_methods(_file)
    info = 'Use empty lines between method definitions and also to break up methods into logical paragraphs internally.'
    arr = []
    _file.each_with_index do  |v,i|
      arr << ["line: #{i+1}", info, ["...",v,_file[i+1],"..." ]] if i+1<_file.size && _file[i+1].strip.include?("def ") && (v.strip=="end" || v.strip.include?("def "))
    end
    arr
  end

  def several_lines(_file)
    info = 'Don’t use several empty lines in a row.'
    arr = []
    _file.each_with_index do  |v,i|
      arr << ["line: #{i+1}", info, ["...",v,_file[i+1],_file[i+2],"..." ]] if i+2<_file.size && _file[i+1].strip.empty? && _file[i+2].strip.empty?
    end
    arr
  end

  def one_class(_file)
    info = 'Aim to have just a single class/module per source file.'
    arr = []
    val=[]
    _file.each_with_index do  |v,i|
       val << ["line: #{i+1}",v] if v.split(" ").include?("class") ||  v.split(" ").include?("module")
    end
    arr << ["class/module limit", info, val] if val.size>1
    arr
  end
end
