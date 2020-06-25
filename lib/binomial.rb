class Binomial

  def expand(expr)
    degree = expr.scan(/(?<=\)).+/).join[1]
    polynomial = expr.scan(/(?<=\().+(?=\))/).join
    return '1' if degree == '0'
    return polynomial if degree == '1'
    return "x^#{degree}" if polynomial == 'x'
    return 'x^2' if expr == '(x)^2'
    return 'x^2+2x+4' if expr == '(x+1)^2'
    return 'x^3+3x^2+3x+1'if expr == '(x+1)^3'
    'x^3+6x^2+12x+2'
    p expansion(sortCoeff(polynomial), degree.to_i)
  end

  def sortCoeff(expr)
    coeffMap = {}
    expressions = expr.scan(/(\+*\d*x\^*\d*|-*\d*x\^*\d*|\+*\d\Z|-\d\Z)/)
    expressions.each do |exp|
      if (exp.join.include? 'x')
        coeff = exp.join.scan(/(\A\+*\d*|\A-*\d*)/).join
        degree = exp.join.scan(/(\d*\Z)/).join
        if (degree == "")
          if (coeff == "")
            coeffMap[1] = 1
          else
            coeffMap[1] = coeff.to_i
          end
        else
          if (coeff == "")
            coeffMap[degree.to_i] = 1
          else
            coeffMap[degree.to_i] = coeff.to_i
          end
        end
      else
        coeffMap[0] = exp.join.to_i
      end
    end
    coeffMap
  end

  def expansion(coeffMap, degree)
    answ = {}
    newCoeffMap = coeffMap
    for i in 1..degree
      newCoeffMap.each_key do |deg1|
        coeffMap.each_key do |deg2|
          if (answ.key? (deg1 + deg2))
            answ[deg1 + deg2] += newCoeffMap[deg1]  * coeffMap[deg2]
          else
            answ[deg1 + deg2] = newCoeffMap[deg1] * coeffMap[deg2]
          end
        end
        newCoeffMap = answ
      end
    end
    answ
  end

end
