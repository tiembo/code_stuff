class ArrayIterator
  def initialize(array)
    @array = array
    @index = 0
  end

  def item
    @array[@index]
  end

  def next_item
    value = item
    @index += 1
    value
  end
  
  def has_next?
    @index < @array.length
  end
end
