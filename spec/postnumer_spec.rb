# frozen_string_literal: true

RSpec.describe Postnumer do
  it 'has a version number' do
    expect(Postnumer::VERSION).not_to be nil
  end

  it 'returns a list of all Icelandic postal codes as a hash usinng the all ' \
     'class method' do
    all_postal_codes = Postnumer.all
    expect(all_postal_codes).to be_a Hash
    all_postal_codes.each do |pnr, locality|
      expect(pnr).to be_a Integer
      expect(locality).to be_a String
    end
    expect(all_postal_codes[310]).to eq 'Borgarnes'
  end

  it 'returns an array of localities and postal codes usable for Rails\'' \
     'options_for_select method' do
    postal_code_options = Postnumer.all_options
    expect(postal_code_options).to be_a Array
    postal_code_options.each do |a|
      expect(a.first).to be_a String
      expect(a.last).to be_a Integer
      expect(a.first[0, 3]).to eq a.last.to_s
    end
    select_options = FormOptionsHelper.options_for_select(postal_code_options)
    expect(select_options).to be_a String
    expect(select_options.split("\n").length).to eq postal_code_options.length
    expect(select_options).to start_with '<option value="101">101 Reykjavík</option>'
  end

  it 'finds locality from postal code using a class method' do
    expect(Postnumer.locality(310)).to eq 'Borgarnes'
    expect(Postnumer.locality('101')).to eq 'Reykjavík'
  end

  it 'finds locality from postal code using an instance method' do
    postnumer = Postnumer.new(310)
    expect(postnumer.locality).to eq 'Borgarnes'

    postnumer_from_str = Postnumer.new('101')
    expect(postnumer_from_str.locality).to eq 'Reykjavík'
  end

  it 'finds validity of a postal code using a class method' do
    expect(Postnumer.valid?(310)).to eq true
    expect(Postnumer.valid?('101')).to eq true
    expect(Postnumer.valid?(999)).to eq false
    expect(Postnumer.valid?('foo')).to eq false
    expect(Postnumer.valid?(1)).to eq false
    expect(Postnumer.valid?(-310)).to eq false
  end
end
