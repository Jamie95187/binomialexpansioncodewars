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

    it('should return x^2') do
      expect(binomial.expand('(x)^2')).to eq('x^2')
      expect(binomial.expand('(x+1)^2')).to eq('x^2+2x+4')
    end

  end

end
