require 'binomial'

describe 'binomial' do

  describe '#expand' do

    binomial = Binomial.new

    it('should return 1') do
      expect(binomial.expand('(x+1)^0')).to eq('1')
      expect(binomial.expand('(x)^0')).to eq('1')
    end

    it('should return itself') do
      expect(binomial.expand('(x+1)^1')).to eq('x+1')
      expect(binomial.expand('(x+2)^1')).to eq('x+2')
    end

    it('should return correct expansion after increasing degree by 2') do
      expect(binomial.expand('(x)^2')).to eq('x^2')
      expect(binomial.expand('(x+2)^2')).to eq('x^2+4x+4')
    end

    it('should return correct expansion after increasing degree by 3') do
      expect(binomial.expand('(x)^3')).to eq('x^3')
      expect(binomial.expand('(x+1)^3')).to eq('x^3+3x^2+3x+1')
      expect(binomial.expand('(x+2)^3')).to eq('x^3+6x^2+12x+8')
      expect(binomial.expand('(x-1)^3')).to eq('x^3-3x^2+3x-1')
      expect(binomial.expand('(2x-3)^3')).to eq('8x^3-36x^2+54x-27')
    end

    it('should return correct expansion when using a different variable') do
      expect(binomial.expand('(5m+3)^4')).to eq('625m^4+1500m^3+1350m^2+540m+81')
    end

    it('should return correct expansion when first coeff is negative') do
      expect(binomial.expand('(-5m+3)^4')).to eq('625m^4-1500m^3+1350m^2-540m+81')
      expect(binomial.expand('(-2k-3)^3')).to eq('-8k^3-36k^2-54k-27')
    end
  end

end
