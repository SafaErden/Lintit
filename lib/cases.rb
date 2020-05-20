module Cases
  def line_length?(file)
    arr=[["line_length","line:10","Limit lines to 80 characters."]]
    

    arr
  end

  def trailing_white_space?(file)
    "Avoid trailing whitespace."
  end

  def new_line?(file)
    "End each file with a newline."
  end

  def semi_colon?(file)
    "Don’t use ; to terminate statements and expressions."
  end

  def space_operator?(file)
    "Use spaces around operators, after commas, colons and semicolons."
  end

  def space_braces?(file)
    "No spaces after (, [ or before ], ). Use spaces around { and before }."
  end

  def space_after_bang?(file)
    "No space after !."
  end

  def line_between_methods?(file)
    "Use empty lines between method definitions and also to break up methods into logical paragraphs internally."
  end

  def several_lines?(file)
    "Don’t use several empty lines in a row."
  end

  def empty_accessor?(file)
    "Use empty lines around attribute accessor."
  end

  def space_equals?(file)
    "Use spaces around the = operator when assigning default values to method parameters:"
  end

  def snake_case?(file)
    "Use snake_case for symbols, methods and variables."
  end

  def camel_case?(file)
    "Use CamelCase for classes and modules. (Keep acronyms like HTTP, RFC, XML uppercase)."
  end

  def one_class?(file)
    "Aim to have just a single class/module per source file. Name the file name as the class/module, but replacing CamelCase with snake_case."
  end

end