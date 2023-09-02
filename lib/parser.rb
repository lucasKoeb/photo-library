# frozen_string_literal: true

MAX_PHOTOS = 100

def input_lines(input)
  lines = input.split("\n")
  raise "Invalid input: the limit of photos is #{MAX_PHOTOS}." if lines.length > MAX_PHOTOS

  lines
end

def parse(line)
  input_values = line.split(',').map(&:strip)
  raise ArgumentError, "Invalid input format: #{line}" if input_values.length != 3

  file, city, timestamp = input_values
  filename, extension = file.split('.')
  raise ArgumentError, "City name is too long #{city}" if city.length > 20
  raise ArgumentError, "Filename is too long #{filename}" if filename.length > 20

  [extension, city.capitalize, Time.new(timestamp)]
end
