class Triangle
   attr_reader :side_1, :side_2, :side_3

   def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
   end

   def kind
    if has_triangle_inequality || any_side_less_than_zero
      raise TriangleError.new("This is not a valid triangle")
    elsif side_1 == side_2 && side_2 == side_3
      :equilateral
    elsif side_1 == side_2 || side_1 == side_3 || side_2 == side_3
      :isosceles
    else
      :scalene
    end
  end

   class TriangleError < StandardError
    def message
      "This is not a valid triangle"
    end
  end

   def any_side_less_than_zero
    side_1 <= 0 ||
    side_2 <= 0 ||
    side_3 <= 0
  end

   def has_triangle_inequality
    side_1 + side_2 <= side_3 ||
    side_3 + side_2 <= side_1 ||
    side_1 + side_3 <= side_2
  end
end
