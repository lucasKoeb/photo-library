# frozen_string_literal: true

require_relative 'renamed_photo'

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

  def renamed_photos
    photos = []
    @photos.sort_by(&:timestamp).each_with_index do |photo, index|
      photos << RenamedPhoto.new(photo.id, format_name(photo, index))
    end
    photos
  end

  protected

  def format_name(photo, index)
    "#{@location}#{format(index_format, index + 1)}.#{photo.extension}"
  end

  def index_format
    "%0#{Math.log10(@photos.length + 1).ceil}d"
  end

  def validate_location(location)
    raise ArgumentError, 'Location is required' if location.nil?
    raise ArgumentError, 'Location must be a string' unless location.is_a? String
    raise ArgumentError, 'Location cannot be empty' if location.empty?
  end
end
