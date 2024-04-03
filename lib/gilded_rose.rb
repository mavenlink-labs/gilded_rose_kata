def update_quality(items)
  items.each do |item|
    if item.name == 'Aged Brie'
      item.quality += 1 if item.quality < 50
      item.sell_in -= 1
      item.quality += 1 if item.sell_in < 0 && item.quality < 50
    elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
      item.quality += 1 if item.quality < 50
      item.quality += 1 if item.quality < 50 && item.sell_in < 11
      item.quality += 1 if item.quality < 50 && item.sell_in < 6
      item.sell_in -= 1
      item.quality = 0 if item.sell_in < 0
    elsif item.name != 'Sulfuras, Hand of Ragnaros'
      item.quality -= 1 if item.quality > 0
      item.sell_in -= 1
      item.quality -= 1 if item.quality > 0 && item.sell_in < 0
    end
  end
end

#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------

Item = Struct.new(:name, :sell_in, :quality)
