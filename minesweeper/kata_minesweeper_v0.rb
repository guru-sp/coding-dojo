require "matrix"

def adjacents(grid, x, y)
  [
    [x-1,y],
    [x-1,y-1],
    [x, y+1],
    [x+1,y],
    [x+1,y+1],
    [x, y-1],
    [x-1,y+1],
    [x+1,y-1]
  ].map { |x, y|
    next if x.negative? or y.negative?

    grid[x, y]
  }.compact
end

def solve(grid)
  grid.to_a.each_with_index.map do |linha, y|
    linha.each_with_index.map do |el, x|
      next el if el == "*"

      adjacents(grid, x, y).filter { |el| el == "*" }.count
    end
  end
end

# inputs = []

# while(input = gets)
#   inputs << input
# end

# p inputs

loop.with_index do |_, field|
  y, x = gets.chomp.split.map(&:to_i)

  break if x.to_i.zero? && y.to_i.zero?

  grid = Matrix[*y.times.map { gets.chomp.chars }]

  puts "Field ##{field+1}:"
  solve(grid).each { |l| puts l.join }
end

# while coordenadas.chomp != '0 0'
#   coordenadas_x, coordenadas_y = coordenadas.chomp.split

#   grid = Matrix[*coordenadas_x.to_i.times.map {gets.chomp.chars}]

#   puts ""
#   puts "Field ##{field}:"
#   solve(grid).each do |l|
#     puts l.join()
#   end

#   field += 1
#   coordenadas = gets
# end
