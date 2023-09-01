# frozen_string_literal: true

require_relative 'photo_organizer/app'

def solution(input)
  photo_groups = generate_groups input
  list_photos photo_groups
end
