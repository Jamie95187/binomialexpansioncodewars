require 'binomial'

describe 'binomial' do

  describe '#expand' do

    binomial = Binomial.new

    it('should return itself') do
      expect(binomial.expand('(x+1)^1')).to eq('x+1')
    end
  end

end
