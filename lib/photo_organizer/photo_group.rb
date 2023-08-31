# frozen_string_literal: true

# PhotoGroup represents a collection of photos that share the same location
class PhotoGroup
  attr_reader :location

  def initialize(location)
    validate_location(location)

    @location = location
    @photos = []
  end

  def add_photo(photo)
    @photos << photo
  end

  def sorted_photo_names
    photos = {}
    @photos.sort_by(&:timestamp).each_with_index do |photo, index|
      photos[photo.id] = formatted_name(photo, index)
    end
    photos
  end

  protected

  def formatted_name(photo, index)
    "#{@location}#{index + 1}.#{photo.extension}"
  end

  def validate_location(location)
    raise ArgumentError, 'Location is required' if location.nil?
    raise ArgumentError, 'Location must be a string' unless location.is_a? String
    raise ArgumentError, 'Location cannot be empty' if location.empty?
  end
end
