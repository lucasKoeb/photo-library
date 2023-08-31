# frozen_string_literal: true

# Contains the allowed file extensions for photos
EXTENSIONS = %w[jpg png jpeg].freeze

# Photo represents a unique photo with timestamp and extension
class Photo
  attr_reader :id, :extension, :timestamp

  def initialize(id, extension, timestamp)
    validate_timestamp(timestamp)
    validate_extension(extension)

    @id = id
    @extension = extension.downcase
    @timestamp = timestamp
  end

  protected

  def validate_extension(extension)
    raise ArgumentError, 'File extension is required' if extension.nil?
    raise ArgumentError, 'File extension must be a string' unless extension.is_a? String
    raise ArgumentError, 'File extension cannot be empty' if extension.empty?
    raise ArgumentError, "#{extension} is not a supported file extension" unless EXTENSIONS.include? extension.downcase
  end

  def validate_timestamp(timestamp)
    raise ArgumentError, 'Timestamp is required' if timestamp.nil?
    raise ArgumentError, 'Timestamp must be an instance of Time' unless timestamp.is_a? Time
  end
end
