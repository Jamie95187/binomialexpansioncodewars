class Binomial

  def expand(expr)
    var = expr.scan(/[a-z]/).first
    degree = expr.scan(/(?<=\)).+/).join[1]
    polynomial = expr.scan(/(?<=\().+(?=\))/).join
    return '1' if degree == '0'
    return polynomial if degree == '1'
    answer = ""
    # puts expansion(sort(polynomial, var), degree.to_i)
    expansion(sort(polynomial, var), degree.to_i).each do |k, v|
      if k == 0
        if v >= 1
          answer += "+#{v}"
        else
          answer += "#{v}"
        end
      elsif k == 1
        if v == 1
          answer += "#{var}"
        elsif v == -1
          answer += "-#{var}"
        elsif v > 1
          answer += "+#{v}#{var}"
        else
          answer += "#{v}#{var}"
        end
      else
        if v == 1
          answer += "#{var}^#{k}"
        elsif v == -1
          answer += "-#{var}^#{k}"
        elsif v > 1
          answer += "+#{v}#{var}^#{k}"
        else
          answer += "#{v}#{var}^#{k}"
        end
      end
    end
    if answer[0] == '+'
      answer = answer[1, answer.length - 1]
    end
    answer
  end

  def sort(expr, var)
    coeffMap = {}
    expressions = expr.scan(/(\+*\d*#{var}\^*\d*|-*\d*#{var}\^*\d*|\+*\d\Z|-\d\Z)/)
    # p expressions
    expressions.each do |exp|
      # puts "exp ---- #{exp}"
      if (exp.join.include? "#{var}")
        coeff = exp.join.scan(/(\A-\d*|\A\+*\d*)/).join
        # puts "Coeff ----- #{exp.join}"
        # puts "Coeff ----- #{coeff}"
        degree = exp.join.scan(/(\d*\Z)/).join
        if (degree == "")
          if (coeff == "")
            coeffMap[1] = 1
          else
            # puts "Coeff ----- #{coeff}"
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
    newCoeffMap = coeffMap
    for i in 1...degree
      answ = {}
      newCoeffMap.dup.each_key do |deg1|
        # puts "deg: #{deg1} -- coeff: #{newCoeffMap[deg1]}"
        coeffMap.each_key do |deg2|
          if (answ.has_key? deg1+deg2)
            # puts "#{deg1+deg2} += #{newCoeffMap[deg1]}x#{coeffMap[deg2]}"
            answ[deg1 + deg2] += newCoeffMap[deg1]*coeffMap[deg2]
          else
            # puts "#{deg1+deg2} = #{newCoeffMap[deg1]}x#{coeffMap[deg2]}"
            answ[deg1 + deg2] = newCoeffMap[deg1]*coeffMap[deg2]
          end
        end
      end
      # puts " ------------------------------- "
      newCoeffMap = answ
    end
    answ
  end

end
