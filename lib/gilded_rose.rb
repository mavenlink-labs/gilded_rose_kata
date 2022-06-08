class NormalItem
  attr_reader :item

  def initialize(item)
    @item = item
  end

  def quality
    if item.quality > 0
      item.quality -= 1
    end
  end

  def sell_in
    item.sell_in -= 1
    if item.sell_in < 0 && item.quality > 0
      item.quality -= 1
    end
  end

  def update_quality
    quality
    sell_in
  end
end

class AgedBrie < NormalItem
  def quality
    if item.quality < 50
      item.quality += 1
    end
  end

  def sell_in
    item.sell_in -= 1
    if item.sell_in < 0 && item.quality < 50
      item.quality += 1
    end
  end
end

class BackstagePasses < NormalItem
  def quality
    if item.quality < 50
      item.quality += 1
      if item.sell_in < 11 && item.quality < 50
        item.quality += 1
      end
      if item.sell_in < 6 && item.quality < 50
        item.quality += 1
      end
    end
  end

  def sell_in
    item.sell_in -= 1
    if item.sell_in < 0
      item.quality = item.quality - item.quality
    end
  end
end

class Sulfuras < NormalItem
  def quality
    item.quality
  end

  def sell_in
    item.sell_in
  end
end

class ConjuredItem < NormalItem
  def quality
    if item.quality > 0
      item.quality -= 2
    end

    if item.quality < 0
      item.quality = 0
    end
  end

  def sell_in
    item.sell_in -= 1
    if item.sell_in < 0 && item.quality > 0
      item.quality -= 2

      if item.quality < 0
        item.quality = 0
      end
    end
  end
end

def update_quality(items)
  itemLookup = {
    'Aged Brie' => AgedBrie,
    'Backstage passes to a TAFKAL80ETC concert' => BackstagePasses,
    'Sulfuras, Hand of Ragnaros' => Sulfuras,
    'Conjured Mana Cake' => ConjuredItem
  }

  items.each do |item|
    itemLookup.fetch(item.name, NormalItem).new(item).update_quality
  end
end

#----------------------------
# DO NOT CHANGE THINGS BELOW
#----------------------------

Item = Struct.new(:name, :sell_in, :quality)
