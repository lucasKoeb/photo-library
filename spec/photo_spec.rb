# frozen_string_literal: true

require 'photo_organizer/photo'
require 'date'

# rubocop:disable Metrics/BlockLength
describe 'Photo' do
  describe 'timestamp' do
    it 'is required' do
      expect do
        Photo.new(1, 'jpeg', nil)
      end.to raise_error(ArgumentError)
    end

    it 'must be an instance of Time' do
      expect do
        Photo.new(1, 'jpeg', DateTime.now)
      end.to raise_error(ArgumentError)
    end
  end

  describe 'file extension' do
    it 'raises an argument error if nil' do
      expect do
        Photo.new(1, nil, Time.now)
      end.to raise_error(ArgumentError)
    end

    it 'raises an argument error if empty' do
      expect do
        Photo.new(1, '', Time.now)
      end.to raise_error(ArgumentError)
    end

    it 'accepts the allowed values' do
      timestamp = Time.now
      jpg_photo = Photo.new(1, 'jpg', timestamp)
      png_photo = Photo.new(2, 'png', timestamp)
      jpeg_photo = Photo.new(3, 'jpeg', timestamp)
      expect(jpg_photo.extension).to eq('jpg')
      expect(png_photo.extension).to eq('png')
      expect(jpeg_photo.extension).to eq('jpeg')
    end

    it 'accepts and converts upcase values' do
      timestamp = Time.now
      photo = Photo.new(1, 'JPG', timestamp)
      expect(photo.extension).to eq('jpg')
    end

    it 'raises an argument error if unknown' do
      expect do
        Photo.new(1, 'pdf', Time.now)
      end.to raise_error(ArgumentError)
    end

    it 'requires a string' do
      expect do
        Photo.new(1, 1, Time.now)
      end.to raise_error(ArgumentError)
    end
  end
end
# rubocop:enable Metrics/BlockLength
