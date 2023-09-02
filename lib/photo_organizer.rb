# frozen_string_literal: true

require_relative 'parser'
require_relative 'photos/photo'
require_relative 'photos/photo_group'

def solution(input)
  photo_groups = generate_groups(input)
  list_photos(photo_groups)
end

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
