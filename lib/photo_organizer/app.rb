# frozen_string_literal: true

require_relative 'photo'
require_relative 'photo_group'

MAX_PHOTOS = 100

def generate_groups(input)
  photo_groups = {}
  input_lines(input).each_with_index do |line, index|
    validate_input(input, index)
    filename, city, timestamp = line.split(',').map(&:strip)
    file_extension = filename.split('.')[1]
    photo_groups[city] ||= PhotoGroup.new(city)
    photo_groups[city].add_photo Photo.new(index, file_extension, Time.new(timestamp.strip))
  end
  photo_groups
end

def input_lines(input)
  lines = input.split("\n")
  puts 'Tem mto' if lines.length > MAX_PHOTOS
  lines
end

def validate_input(input, index); end

def output(photo_groups)
  renamed_photos = []
  photo_groups.each_value do |group|
    renamed_photos.push(*group.renamed_photos)
  end
  renamed_photos.sort_by(&:id).map(&:filename).join("\n")
end
