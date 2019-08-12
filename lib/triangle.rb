class Triangle
attr_accessor :x, :y, :z,
  :equilateral, :isosceles, :scalene

   def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

   def kind
    if x == 0 || y == 0 || z == 0
      raise TriangleError
    elsif x + y <= z || x + z <= y || y + z <= x
      raise TriangleError
    elsif x == y && y == z
      kind = :equilateral
    elsif x == y && x != z || y == z && y != x || x == z && x != y
      kind = :isosceles
    else
      kind = :scalene
    end
  end
  
    def distinct_side_lengths
    sides.uniq.count
  end

  def zero_or_negative_side?
    sides.any? {|side| side <= 0 }
  end

  def satisfies_triangle_inequality?
    0 < sides.inject(&:+) - 2 * sides.max
  end
end


class TriangleError < StandardError
  def message
    "This is not a valid triangle."
  end
end
