# frozen_string_literal: true

# RenamedPhoto represents a photo renamed based on the group it is on
class RenamedPhoto
  attr_reader :id, :filename

  def initialize(id, filename)
    @id = id
    @filename = filename
  end
end
