require 'pry'

def rotated_image(image, size: 4)
  0..size.times do |i|
    0..size.times do |j|
      temp = image[i][j]
      image[i][j] = image[j][i]
      image[j][i] = temp
    end
  end
  print_image(image)
end

def build_image(size: 4)
  count = 1
  image = Array.new(size) { Array.new(size) }
  0..size.times do |i|
    0..size.times do |j|
      image[i][j] = count
      count = count + 1
    end
  end
  image
end


def print_image(image, size: 4)
  0..size.times.each do |row|
    0..size.times.each do |col|
      print image[row][col] + "  "
    end
    puts
  end
end

image = build_image

puts "Input:"
print_image(image)

puts "Rotated: "
rotated_image(image)