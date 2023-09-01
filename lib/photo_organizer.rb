# frozen_string_literal: true

require_relative 'photo_organizer/app'

def solution(input)
  photo_groups = generate_groups input
  output photo_groups
end

def output(photo_groups)
  renamed_photos = []
  photo_groups.each_value do |group|
    renamed_photos.push(*group.renamed_photos)
  end
  renamed_photos.sort_by(&:id).map(&:filename).join("\n")
end
