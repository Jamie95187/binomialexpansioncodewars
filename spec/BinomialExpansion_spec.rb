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
    end

  end

end
