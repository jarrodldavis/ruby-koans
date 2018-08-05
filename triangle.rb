# Triangle Project Code.

# Triangle analyzes the lengths of the sides of a triangle
# (represented by a, b and c) and returns the type of triangle.
#
# It returns:
#   :equilateral  if all sides are equal
#   :isosceles    if exactly 2 sides are equal
#   :scalene      if no sides are equal
#
# The tests for this method can be found in
#   about_triangle_project.rb
# and
#   about_triangle_project_2.rb
#
def triangle(a, b, c)
  sides = [a, b, c]

  if sides.detect { |side| side <= 0 }
    raise TriangleError, "One more more sides are invalid"
  end

  3.times do
    if sides[0] + sides[1] <= sides[2]
      raise TriangleError, "One or more sides are invalid"
    end
    sides.rotate!
  end

  unique_side_lengths = {a => true, b => true, c => true}

  case unique_side_lengths.length
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  else raise TriangleError, "Unexpected triangle"
  end
end

# Error class used in part 2.  No need to change this code.
class TriangleError < StandardError
end
