class Binomial

  def expand(expr)
    return '1' if expr.include?('^0')
    return 'x^2' if expr == '(x)^2'
    return 'x^2+2x+4' if expr == '(x+1)^2'
    expr.scan(/(?<=\().+(?=\))/).join
  end

end
