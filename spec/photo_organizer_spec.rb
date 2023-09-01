# frozen_string_literal: true

require 'photo_organizer'

# rubocop:disable Metrics/BlockLength
describe 'solution' do
  it 'should not allow more than 100 photos' do
    photos = []
    101.times do |index|
      time = Time.new('2023-08-30 10:00:00') + index * 60
      photos << "photo#{index}.jpeg, Florianopolis, #{time.strftime('%Y-%m-%d %H:%M:%S')}"
    end
    expect do
      expect(solution(photos.join("\n")))
    end.to raise_error(RuntimeError)
  end

  it 'sorts input by original order and indexes based on city' do
    input = [
      'photo2.jpeg, Florianopolis, 2023-08-30 10:10:00',
      'photo1.png, Rome, 2022-04-10 08:53:00',
      'photo1.jpeg, Florianopolis, 2023-08-30 10:00:00'
    ].join("\n")
    expect(solution(input)).to eq("Florianopolis2.jpeg\nRome1.png\nFlorianopolis1.jpeg")
  end

  it 'checks for missing input' do
    input = [
      'photo2.jpeg, Florianopolis, 2023-08-30 10:10:00',
      'Rome, 2022-04-10 08:53:00',
      'photo1.jpeg, Florianopolis, 2023-08-30 10:00:00'
    ].join("\n")
    expect do
      solution(input)
    end.to raise_error(ArgumentError)
  end

  it 'checks for long city names' do
    input = [
      'photo2.jpeg, Florianopolis, 2023-08-30 10:10:00',
      'Photo1.png, Rome, 2022-04-10 08:53:00',
      'photo1.jpeg, Somecitythatdoesnotexistandhasahugename, 2023-08-30 10:00:00'
    ].join("\n")
    expect do
      solution(input)
    end.to raise_error(ArgumentError)
  end

  it 'checks for long file names' do
    input = [
      'photo2.jpeg, Florianopolis, 2023-08-30 10:10:00',
      'Photo1.png, Rome, 2022-04-10 08:53:00',
      'filenamethathasmorethantwentyletters.jpeg, Florianopolis, 2023-08-30 10:00:00'
    ].join("\n")
    expect do
      solution(input)
    end.to raise_error(ArgumentError)
  end
end
# rubocop:enable Metrics/BlockLength
