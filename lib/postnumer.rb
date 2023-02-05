# frozen_string_literal: true

# The main Postnumer classs
class Postnumer
  VERSION = '0.1.0'

  POSTNUMERASKRA = {
    101..113 => 'Reykjavík',
    116      => 'Reykjavík',
    121..125 => 'Reykjavík',
    127..130 => 'Reykjavík',
    132      => 'Reykjavík',
    161..162 => 'Reykjavík',
    170..172 => 'Seltjarnarnes',
    190..192 => 'Vogar',
    200..203 => 'Kópavogur',
    206      => 'Kópavogur',
    210      => 'Garðabær',
    212      => 'Garðabær',
    220..222 => 'Hafnarfjörður',
    225      => 'Garðabær (Álftanes)',
    230      => 'Reykjanesbær',
    232..233 => 'Reykjanesbær',
    235      => 'Keflavíkurflugvöllur',
    240..241 => 'Grindavík',
    245..246 => 'Sandgerði',
    250..251 => 'Garður',
    260      => 'Reykjanesbær',
    262      => 'Reykjanesbær',
    270..271 => 'Mosfellsbær',
    276      => 'Mosfellsbær',
    300..302 => 'Akranes',
    310..311 => 'Borgarnes',
    320      => 'Reykholt í Borgarfirði',
    340..342 => 'Stykkishólmur',
    345      => 'Flatey á Breiðafirði',
    350..351 => 'Grundafjörður',
    355      => 'Ólafsvík',
    356      => 'Snæfellsbær',
    360      => 'Hellissandur',
    370..371 => 'Búðardalur',
    380..381 => 'Reykhólahreppur',
    400..401 => 'Ísafjörður',
    410      => 'Hnífsdalur',
    415..416 => 'Bolungarvík',
    420..421 => 'Súðavík',
    425..426 => 'Flateyri',
    430..431 => 'Suðureyri',
    450..451 => 'Patreksfjörður',
    460..461 => 'Tálknafjörður',
    465..466 => 'Bíldudalur',
    470..471 => 'Þingeyri',
    500      => 'Staður',
    510..512 => 'Hólmavík',
    520      => 'Drangsnes',
    524      => 'Árneshreppur',
    530..531 => 'Hvammstangi',
    540..541 => 'Blönduós',
    545..546 => 'Skagaströnd',
    550..551 => 'Sauðárkrókur',
    560..561 => 'Varmahlíð',
    565..566 => 'Hofsós',
    570      => 'Fljót',
    580..581 => 'Siglufjörður',
    600..607 => 'Akureyri',
    610      => 'Grenivík',
    611      => 'Grímsey',
    616      => 'Grenivík',
    620..621 => 'Dalvík',
    525..526 => 'Ólafsfjörður',
    630      => 'Hrísey',
    640..641 => 'Húsavík',
    645      => 'Fosshóll',
    650      => 'Laugar',
    660      => 'Mývatn',
    670..671 => 'Kópasker',
    675..676 => 'Raufarhöfn',
    680..681 => 'Þórshöfn',
    685..686 => 'Bakkafjörður',
    690..691 => 'Vopnafjörður',
    700..701 => 'Egilsstaðir',
    710..711 => 'Seyðisfjörður',
    715      => 'Mjóifjörður',
    720..721 => 'Borgarfjörður (eystri)',
    730..731 => 'Reyðarfjörður',
    735..736 => 'Eskifjörður',
    740..741 => 'Neskaupsstaður',
    750..751 => 'Fáskrúðsfjörður',
    755..756 => 'Stöðvarfjörður',
    760..761 => 'Breiðdalsvík',
    765..766 => 'Djúpivogur',
    780..781 => 'Höfn í Hornafirði',
    785      => 'Öræfi',
    800..806 => 'Selfoss',
    810      => 'Hveragerði',
    815      => 'Þorlákshöfn',
    816      => 'Ölfus',
    820      => 'Eyrarbakki',
    825      => 'Stokkseyri',
    840      => 'Laugarvatn',
    845..846 => 'Flúðir',
    850..851 => 'Hella',
    860..861 => 'Hvolsvöllur',
    870..871 => 'Vík',
    880..881 => 'Kirkjubæjarklaustur',
    900      => 'Vestmannaeyjar',
    902      => 'Vestmannaeyjar'
  }.freeze

  attr_reader :locality, :code

  def self.all
    results = {}
    POSTNUMERASKRA.each do |pnr_range, locality|
      if pnr_range.is_a?(Integer)
        results[pnr_range] = locality
        next
      end
      pnr_range.to_a.each do |pnr|
        results[pnr] = locality
      end
    end
    results
  end

  def self.all_options
    results = []
    all.each do |pnr, locality|
      results << ["#{pnr} #{locality}", pnr]
    end
    results
  end

  def self.locality(postal_code)
    result = POSTNUMERASKRA.select { |p| p === postal_code.to_i }

    return nil if result.empty?

    result.first.last
  end

  def self.valid?(postal_code)
    return true if locality(postal_code.to_i)

    false
  end

  def initialize(postal_code)
    result = POSTNUMERASKRA.select { |p| p === postal_code.to_i }
    raise ArgumentError, 'Postal code is invalid' if result.empty?

    @code     = postal_code.to_i
    @locality = result.first.last
  end
end
