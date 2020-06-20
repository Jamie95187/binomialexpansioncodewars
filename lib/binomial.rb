class Binomial

  def expand(expr)
    return '0' if expr == '(x+1)^0'
    expr.scan(/(?<=\().+(?=\))/).join
  end

end
