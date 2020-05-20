module Cases
  def line_length(file)
    type="line_length"
    info="Limit lines to 80 characters."
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

  def trailing_white_space(file)
    type="trailing_white_space"
    info="Avoid trailing whitespace."
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

  def new_line(file)
    type="new_line"
    info="End each file with a newline."
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

  def semi_colon(file)
    type="semi_colon"
    info="Don’t use ; to terminate statements and expressions."
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

  def space_operator(file)
    type="space_operator"
    info="Use spaces around operators, after commas, colons and semicolons."
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

  def space_braces(file)
    type="space_braces"
    info="No spaces after (, [ or before ], ). Use spaces around { and before }."
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

  def space_after_bang(file)
    type="space_after_bang"
    info="No space after !."
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

  def line_between_methods(file)
    type="line_between_methods"
    info="Use empty lines between method definitions and also to break up methods into logical paragraphs internally."
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

  def several_lines(file)
    type="several_lines"
    info="Don’t use several empty lines in a row."
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

  def empty_accessor(file)
    type="empty_accessor"
    info="Use empty lines around attribute accessor."
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

  def space_equals(file)
    type="space_equals"
    info="Use spaces around the = operator when assigning default values to method parameters:"
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

  def snake_case(file)
    type="snake_case"
    info="Use snake_case for symbols, methods and variables."
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

  def camel_case(file)
    type="camel_case"
    info="Use CamelCase for classes and modules. (Keep acronyms like HTTP, RFC, XML uppercase)."
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

  def one_class(file)
    type="one_class"
    info="Aim to have just a single class/module per source file. Name the file name as the class/module, but replacing CamelCase with snake_case."
    line=0
    arr=[]
    arr << [type,"line: #{line}",info]
    arr
  end

end