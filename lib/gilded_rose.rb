def update_quality(items)
  items.each do |item|
    if item.name == 'Conjured Mana Cake'
      ConjuredItem.new(item).update_item
      next
    end
    if item.name == 'NORMAL ITEM'
      NormalItem.new(item).update_item
      next
    end
    if item.name == 'Aged Brie'
      AgedBrieItem.new(item).update_item
      next
    end

    if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
      if item.quality > 0
        if item.name != 'Sulfuras, Hand of Ragnaros'
          item.quality -= 1
        end
      end
    else
      if item.quality < 50
        item.quality += 1
        if item.name == 'Backstage passes to a TAFKAL80ETC concert'
          if item.sell_in < 11
            if item.quality < 50
              item.quality += 1
            end
          end
          if item.sell_in < 6
            if item.quality < 50
              item.quality += 1
            end
          end
        end
      end
    end
    if item.name != 'Sulfuras, Hand of Ragnaros'
      item.sell_in -= 1
    end
    if item.sell_in < 0
      if item.name != "Aged Brie"
        if item.name != 'Backstage passes to a TAFKAL80ETC concert'
          if item.quality > 0
            if item.name != 'Sulfuras, Hand of Ragnaros'
              item.quality -= 1
            end
          end
        else
          item.quality = item.quality - item.quality
        end
      else
        if item.quality < 50
          item.quality += 1
        end
      end
    end
  end
end

class ItemUpdater
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def update_item
    update_sell_in
    update_quality
  end
end

class AgedBrieItem < ItemUpdater
  def update_sell_in
    item.sell_in -= 1
  end

  def update_quality
    item.quality += 1 if item.quality < 50
    item.quality += 1 if item.sell_in < 0 && item.quality < 50
  end
end

class NormalItem < ItemUpdater
  def update_sell_in
    item.sell_in -= 1
  end

  def update_quality
    item.quality -= 1 if item.quality > 0
    item.quality -= 1 if item.quality > 0 && item.sell_in <= 0
  end
end

class ConjuredItem < ItemUpdater
  def update_item
    update_sell_in
    update_quality
  end

  def update_sell_in
    item.sell_in -= 1
  end

  def update_quality
    item.quality -= 2 if item.quality > 0
    item.quality -= 2 if item.quality > 0 && item.sell_in <= 0
  end
end

#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------

Item = Struct.new(:name, :sell_in, :quality)
