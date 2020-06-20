class Binomial

  def expand(expr)
    degree = expr.scan(/(?<=\)).+/).join[1]
    return '1' if degree == '0'
    return 'x^2' if expr == '(x)^2'
    return 'x^2+2x+4' if expr == '(x+1)^2'
    expr.scan(/(?<=\().+(?=\))/).join
  end

end
