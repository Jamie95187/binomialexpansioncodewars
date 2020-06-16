require 'binomial'

describe 'binomial' do

  describe '#expand' do

    binomial = Binomial.new

    it('should return itself') do
      expect(binomial.expand('(x+1)^1')).to eq('x+1')
      expect(binomial.expand('(x+2)^1')).to eq('x+2')
    end
  end

end
