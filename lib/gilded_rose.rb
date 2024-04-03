def update_quality(items)
  items.each do |item|
    if item.name == 'Aged Brie'
      if item.quality < 50
        item.quality += 1
      end
      item.sell_in -= 1
      if item.sell_in < 0 && item.quality < 50
        item.quality += 1
      end
    end
    if item.name == 'Backstage passes to a TAFKAL80ETC concert'
      if item.quality < 50
        item.quality += 1
      end
      if item.quality < 50 && item.sell_in < 11 && item.quality < 50
        item.quality += 1
      end
      if item.quality < 50 && item.sell_in < 6 && item.quality < 50
        item.quality += 1
      end
      item.sell_in -= 1
      if item.sell_in < 0
        item.quality = 0
      end
    end
    if !(item.name == 'Aged Brie' || item.name == 'Backstage passes to a TAFKAL80ETC concert' || item.name == 'Sulfuras, Hand of Ragnaros')
      if !(item.name == 'Aged Brie' || item.name == 'Backstage passes to a TAFKAL80ETC concert' || item.name == 'Sulfuras, Hand of Ragnaros') && item.quality > 0
        item.quality -= 1
      end
      if !(item.name == "Aged Brie" || item.name == 'Backstage passes to a TAFKAL80ETC concert' || item.name == 'Sulfuras, Hand of Ragnaros')
        item.sell_in -= 1
      end
      if !(item.name == "Aged Brie" || item.name == 'Backstage passes to a TAFKAL80ETC concert' || item.name == 'Sulfuras, Hand of Ragnaros') && item.quality > 0 && item.sell_in < 0 &&
        item.quality -= 1
      end
    end
  end
end

#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------

Item = Struct.new(:name, :sell_in, :quality)
