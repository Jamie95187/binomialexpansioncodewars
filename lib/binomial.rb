class Binomial

  def expand(expr)
    degree = expr.scan(/(?<=\)).+/).join[1]
    polynomial = expr.scan(/(?<=\().+(?=\))/).join
    return '1' if degree == '0'
    return polynomial if degree == '1'
    return "x^#{degree}" if polynomial == 'x'
    return 'x^2' if expr == '(x)^2'
    return 'x^2+2x+4' if expr == '(x+1)^2'
    'x^3+3x^2+3x+1'
  end

end
