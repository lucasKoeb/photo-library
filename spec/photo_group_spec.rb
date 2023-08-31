# frozen_string_literal: true

require 'photo_organizer/photo_group'
require 'date'

# rubocop:disable Metrics/BlockLength
describe 'PhotoGroup' do
  describe 'location' do
    it 'is required' do
      expect do
        PhotoGroup.new(nil)
      end.to raise_error(ArgumentError)
    end

    it 'cannot be empty' do
      expect do
        PhotoGroup.new(nil)
      end.to raise_error(ArgumentError)
    end

    it 'must be an instance of string' do
      expect do
        PhotoGroup.new(DateTime.now)
      end.to raise_error(ArgumentError)
    end

    it 'returns photos sorted by timestamp' do
      first_photo = Photo.new(1, 'jpeg', Time.new('2023-08-30 10:00:00'))
      second_photo = Photo.new(2, 'jpeg', Time.new('2023-08-30 09:55:00'))
      group = PhotoGroup.new('Curitiba')
      group.add_photo(first_photo)
      group.add_photo(second_photo)
      expect(group.sorted_photo_names.keys).to eq([2, 1])
    end

    it 'names photos after the extension and group index' do
      first_photo = Photo.new(1, 'jpeg', Time.new('2023-08-30 10:00:00'))
      second_photo = Photo.new(2, 'png', Time.new('2023-08-30 09:55:00'))
      group = PhotoGroup.new('Curitiba')
      group.add_photo(first_photo)
      group.add_photo(second_photo)
      expect(group.sorted_photo_names.values).to eq(['Curitiba1.png', 'Curitiba2.jpeg'])
    end
  end
end
# rubocop:enable Metrics/BlockLength
