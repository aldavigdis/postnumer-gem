# frozen_string_literal: true

RSpec.describe Postnumer do
  it 'has a version number' do
    expect(Postnumer::VERSION).not_to be nil
  end

  it 'finds locality from postal code using a class method' do
    expect(Postnumer.locality(310)).to be 'Borgarnes'
    expect(Postnumer.locality('101')).to be 'Reykjavík'
  end

  it 'finds locality from postal code using an instance method' do
    postnumer = Postnumer.new(310)
    expect(postnumer.locality).to be 'Borgarnes'

    postnumer_from_str = Postnumer.new('101')
    expect(postnumer_from_str.locality).to be 'Reykjavík'
  end

  it 'finds validity of a postal code using a class method' do
    expect(Postnumer.valid?(310)).to be true
    expect(Postnumer.valid?('101')).to be true
    expect(Postnumer.valid?(999)).to be false
    expect(Postnumer.valid?('foo')).to be false
    expect(Postnumer.valid?(1)).to be false
    expect(Postnumer.valid?(-310)).to be false
  end
end
