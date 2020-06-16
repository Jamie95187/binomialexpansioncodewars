class Binomial

  def expand(expr)
    expr.scan(/(?<=\().+(?=\))/).join
  end

end
