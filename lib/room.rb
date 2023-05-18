class Room

  attr_reader :category, :length, :width

  def initialize(category, length, width, painted = false)
    @category = category
    @length = length
    @width = width
    @painted = painted
  end

  def area
    length * width.to_i
  end

  def is_painted?
    @painted
  end

  def paint
    @painted = true
  end
end
