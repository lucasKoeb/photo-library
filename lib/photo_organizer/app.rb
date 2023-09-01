# frozen_string_literal: true

require_relative 'photo'
require_relative 'photo_group'

MAX_PHOTOS = 100

def generate_groups(input)
  photo_groups = {}
  input_lines(input).each_with_index do |line, index|
    extension, city, timestamp = parse(line)
    photo_groups[city] ||= PhotoGroup.new(city)
    photo_groups[city].add_photo Photo.new(index, extension, timestamp)
  end
  photo_groups
end

def list_photos(photo_groups)
  renamed_photos = []
  photo_groups.each_value do |photo_group|
    renamed_photos.push(*photo_group.renamed_photos)
  end
  renamed_photos.sort_by(&:id).map(&:filename).join("\n")
end

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
