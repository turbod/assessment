require 'spec_helper'

describe NumeralsHelper do

  describe '#number to word test' do
    it 'return twelve' do
      expect(helper.number_to_word(12)).to eq('twelve')
    end

    it 'return fifty-two' do
      expect(helper.number_to_word(52)).to eq('fifty-two')
    end

    it 'return fifty-two' do
      expect(helper.number_to_word(152)).to eq('one hundred and fifty-two')
    end

    it 'return fifty-two' do
      expect(helper.number_to_word(100)).to eq('one hundred')
    end

    it 'return fifty-two' do
      expect(helper.number_to_word(520)).to eq('five hundred and twenty')
    end

    it 'return seven' do
      expect(helper.number_to_word(7)).to eq('seven')
    end

    it 'return forty-two' do
      expect(helper.number_to_word(42)).to eq('forty-two')
    end

    it 'return two thousand and one' do
      expect(helper.number_to_word(2001)).to eq('two thousand and one')
    end

    it 'return nineteen hundred and ninety-nine' do
      expect(helper.number_to_word(1999)).to eq('nineteen hundred and ninety-nine')
    end

  end
end